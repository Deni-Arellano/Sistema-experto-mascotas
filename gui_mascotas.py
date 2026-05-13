import tkinter as tk
from tkinter import messagebox, ttk
from pyswip import Prolog
import os

class SistemaExpertoMascotas:
    def __init__(self, root):
        self.root = root
        self.root.title("SISTEMA EXPERTO DE RECOMENDACIÓN DE MASCOTAS")
        self.root.geometry("550x700")
        self.root.configure(bg="#f8f9fa")

        # Inicializar Prolog
        self.prolog = Prolog()
        try:
            # Cargamos el archivo principal que ya tiene los consults de los demás
            self.prolog.consult("main.pl")
        except Exception as e:
            messagebox.showerror("Error de Prolog", f"No se pudo cargar la base de conocimientos: {e}")

        self.preguntas = [
            {"id": "alergias", "texto": "¿Alguien en casa tiene alergia al pelo o plumas?", "icono": "🤧", "opciones": [("Sí, tenemos", "si"), ("No, ninguna", "no")]},
            {"id": "espacio", "texto": "¿Qué nivel de espacio tienes disponible para una mascota?", "icono": "🏠", "opciones": [("Pequeño (Depa)", "bajo"), ("Medio (Casa)", "medio"), ("Grande (Jardín)", "alto")]},
            {"id": "ninos", "texto": "¿Hay niños en casa?", "icono": "👶", "opciones": [("Sí", "si"), ("No", "no")]},
            {"id": "otras_mascotas", "texto": "¿Ya tienes otras mascotas en casa?", "icono": "🐾", "opciones": [("Sí", "si"), ("No", "no")]},
            {"id": "tiempo", "texto": "¿Cuánto tiempo puedes dedicar diariamente a una mascota?", "icono": "🕒", "opciones": [("Poco (<1h)", "poco"), ("Moderado (2-3h)", "moderado"), ("Mucho (>4h)", "mucho")]},
            {"id": "presupuesto", "texto": "¿Cuál es tu presupuesto mensual para mantener una mascota?", "icono": "💰", "opciones": [("Económico", "bajo"), ("Estándar", "medio"), ("Premium", "alto")]},
            {"id": "experiencia", "texto": "¿Has tenido mascotas antes?", "icono": "🎓", "opciones": [("Sí, tengo exp.", "si"), ("No, soy novato", "no")]},
            {"id": "limpieza", "texto": "¿Te molesta limpiar constantemente el espacio de la mascota?", "icono": "🧹", "opciones": [("Mucho", "si"), ("Poco", "no")]},
            {"id": "responsabilidad", "texto": "¿Estás dispuesto a cuidar una mascota por varios años?", "icono": "🤝", "opciones": [("Absolutamente", "si"), ("No estoy seguro", "no")]},
            {"id": "actividad", "texto": "¿Eres una persona activa?", "icono": "🏃", "opciones": [("Sí, muy activo", "si"), ("No, prefiero calma", "no")]},
            {"id": "convivencia", "texto": "¿Qué tipo de convivencia deseas con tu mascota?", "icono": " ❤️", "opciones": [("Mucha (Compañía)", "mucha"), ("Moderada", "moderada"), ("Solo observación", "observacion")]},
            {"id": "ruido", "texto": "¿Te molesta que tu mascota haga ruido frecuentemente?", "icono": "🔇", "opciones": [("Sí, mucho ruido molesta", "si"), ("No importa", "no")]}
        ]
        
        self.respuestas_usuario = {}
        self.indice_pregunta = 0
        
        self.setup_ui()

    def setup_ui(self):
        # Estilo
        style = ttk.Style()
        style.theme_use('clam')
        style.configure("TButton", font=("Helvetica", 10), padding=10)
        style.configure("Horizontal.TProgressbar", foreground='#4f46e5', background='#4f46e5', thickness=8)

        # Header
        self.header = tk.Frame(self.root, bg="#4f46e5", height=100)
        self.header.pack(fill="x")
        
        self.label_titulo = tk.Label(self.header, text="Conoce a tu mejor amigo", font=("Segoe UI", 20, "bold"), bg="#4f46e5", fg="white")
        self.label_titulo.pack(pady=25)

       

        # Contenedor de la Tarjeta
        self.card = tk.Frame(self.root, bg="white", padx=40, pady=40, highlightthickness=1, highlightbackground="#e5e7eb")
        self.card.place(relx=0.5, rely=0.55, anchor="center", width=450, height=530)

        self.main_frame = tk.Frame(self.card, bg="white")
        self.main_frame.pack(expand=True, fill="both")

        self.label_icono = tk.Label(self.main_frame, text="", font=("Segoe UI", 48), bg="white")
        self.label_icono.pack(pady=10)

        self.label_pregunta = tk.Label(self.main_frame, text="", wraplength=350, justify="center", bg="white", font=("Segoe UI", 14, "bold"), fg="#1f2937")
        self.label_pregunta.pack(pady=20)

        self.frame_opciones = tk.Frame(self.main_frame, bg="white")
        self.frame_opciones.pack(fill="x", pady=10)

        # Barra de progreso al fondo
        self.progress = ttk.Progressbar(self.root, orient="horizontal", length=550, mode="determinate", style="Horizontal.TProgressbar")
        self.progress.pack(side="bottom", fill="x")

        self.mostrar_pregunta()

    def mostrar_pregunta(self):
        # Limpiar botones anteriores
        for widget in self.frame_opciones.winfo_children():
            widget.destroy()

        pregunta_actual = self.preguntas[self.indice_pregunta]
        self.label_icono.config(text=pregunta_actual["icono"])
        self.label_pregunta.config(text=pregunta_actual["texto"])
        
        progreso_val = (self.indice_pregunta / len(self.preguntas)) * 100
        self.progress["value"] = progreso_val

        for texto, valor in pregunta_actual["opciones"]:
            btn = tk.Button(self.frame_opciones, text=texto, width=30, font=("Segoe UI", 11),
                           bg="#f3f4f6", fg="#374151", relief="flat", bd=0, pady=12, cursor="hand2",
                           command=lambda v=valor: self.siguiente_pregunta(v))
            btn.pack(pady=6, fill="x", padx=30)
            btn.bind("<Enter>", lambda e, b=btn: b.config(bg="#e5e7eb", fg="#111827"))
            btn.bind("<Leave>", lambda e, b=btn: b.config(bg="#f3f4f6", fg="#374151"))

    def siguiente_pregunta(self, valor):
        pregunta_id = self.preguntas[self.indice_pregunta]["id"]
        self.respuestas_usuario[pregunta_id] = valor
        
        if self.indice_pregunta < len(self.preguntas) - 1:
            self.indice_pregunta += 1
            self.mostrar_pregunta()
        else:
            self.procesar_resultados()

    def procesar_resultados(self):
        # Limpiar respuestas previas en Prolog
        list(self.prolog.query("limpiar_respuestas."))
        
        # Insertar hechos en Prolog
        for p_id, valor in self.respuestas_usuario.items():
            self.prolog.assertz(f"respuesta({p_id}, {valor})")
        
        # Consultar recomendaciones
        recomendaciones = list(self.prolog.query("recomendada(X)."))
        
        self.mostrar_final(recomendaciones)

    def mostrar_final(self, resultados):
        self.label_icono.config(text="✨")
        self.label_pregunta.config(text="Resultados de Match", font=("Segoe UI", 16, "bold"))
        for widget in self.frame_opciones.winfo_children():
            widget.destroy()
        
        self.progress["value"] = 100

        emoji_map = {"perro": "🐕", "gato": "🐈", "conejo": "🐇", "hamster": "🐹", "pez": "🐠", "tortuga": "🐢", "ave": "🦜"}

        if not resultados:
            self.label_icono.config(text="😕")
            res_label = tk.Label(self.frame_opciones, text="No se encontró una mascota ideal\ncon estas condiciones tan estrictas.", 
                                 bg="white", fg="#991b1b", font=("Segoe UI", 11))
            res_label.pack(pady=20)
        else:
            res_label = tk.Label(self.frame_opciones, text="Mascotas compatibles:", bg="white", font=("Segoe UI", 11), fg="#6b7280")
            res_label.pack(pady=(0, 10))
            
            for r in resultados:
                m_raw = r['X']
                emoji = emoji_map.get(m_raw, "🐾")
                mascota = m_raw.capitalize()
                tk.Label(self.frame_opciones, text=f"{emoji} {mascota}", bg="white", 
                         font=("Segoe UI", 14, "bold"), fg="#059669").pack(pady=4)

        btn_reiniciar = tk.Button(self.frame_opciones, text="🔄 Volver a intentar", width=30, font=("Segoe UI", 11),
                                 bg="#4f46e5", fg="white", relief="flat", bd=0, pady=12, cursor="hand2",
                                 command=self.reiniciar)
        btn_reiniciar.pack(pady=25, fill="x", padx=30)
        btn_reiniciar.bind("<Enter>", lambda e: btn_reiniciar.config(bg="#4338ca"))
        btn_reiniciar.bind("<Leave>", lambda e: btn_reiniciar.config(bg="#4f46e5"))

    def reiniciar(self):
        self.indice_pregunta = 0
        self.respuestas_usuario = {}
        self.mostrar_pregunta()

if __name__ == "__main__":
    root = tk.Tk()
    app = SistemaExpertoMascotas(root)
    root.mainloop()