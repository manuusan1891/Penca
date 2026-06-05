from flask import Flask, render_template, request, redirect, flash
import mysql.connector

app = Flask(__name__)
app.secret_key = "penca_secret_key" # Necesario para mostrar mensajes de éxito

# Configuración de la conexión a MySQL
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="3110", # <-- Poné tu contraseña acá
        database="penca_mundial"
    )

@app.route("/")
def home():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    # Traemos los 72 partidos ordenados por ID para mostrarlos en la web
    cursor.execute("SELECT id, grupo, equipo_local, equipo_visitante, fecha_hora FROM partidos ORDER BY id")
    partidos = cursor.fetchall()
    
    cursor.close()
    conn.close()
    return render_template("index.html", partidos=partidos)

@app.route("/guardar", methods=["POST"])
def guardar_penca():
    # Capturamos los datos del usuario del formulario
    nombre = request.form.get("nombre")
    email = request.form.get("email")
    
    if not nombre or not email:
        return "Por favor, completa tu nombre y email antes de enviar.", 400

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # 1. Verificar si el usuario ya existe por su email, si no, crearlo
        cursor.execute("SELECT id FROM usuarios WHERE email = %s", (email,))
        user = cursor.fetchone()
        
        if user:
            usuario_id = user[0]
        else:
            cursor.execute("INSERT INTO usuarios (nombre, email) VALUES (%s, %s)", (nombre, email))
            conn.commit()
            usuario_id = cursor.lastrowid

        # 2. Recorrer los partidos enviados para guardar las predicciones
        for key in request.form:
            if key.startswith("local_"):
                partido_id = key.split("_")[1]
                goles_local = request.form.get(f"local_{partido_id}")
                goles_vis = request.form.get(f"visitante_{partido_id}")
                
                # Solo guardamos si el usuario ingresó ambos resultados para ese partido
                if goles_local != "" and goles_vis != "":
                    # Usamos ON DUPLICATE KEY UPDATE por si el usuario quiere corregir o reenviar sus votos
                    sql = """
                        INSERT INTO predicciones (usuario_id, partidoid, goles_pred_local, goles_pred_visitante)
                        VALUES (%s, %s, %s, %s)
                        ON DUPLICATE KEY UPDATE goles_pred_local = %s, goles_pred_visitante = %s
                    """
                    cursor.execute(sql, (usuario_id, partido_id, goles_local, goles_vis, goles_local, goles_vis))
        
        conn.commit()
        print(f"Predicciones guardadas con éxito para {nombre}")
        
    except Exception as e:
        conn.rollback()
        return f"Hubo un error al guardar los datos: {str(e)}", 500
    finally:
        cursor.close()
        conn.close()

    return "<h1>¡Tus pronósticos se guardaron impecable! Ya podés cerrar esta pestaña o volver atrás.</h1>"

if __name__ == "__main__":
    app.run(debug=True)