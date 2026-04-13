# Automat

Sistema unificado con dos piezas:

- Bot de Telegram como interfaz móvil.
- Daemon de escritorio para ejecutar tareas locales.

## Qué incluye

- Registro de gastos e ingresos con saldo de capital.
- Exportación a Excel.
- Predictor de buses con estadísticas simples por línea y día.
- Clasificador de archivos basado en convención de nombres.
- Limpieza del PC con aprobación manual.
- Supervisor de procesos con lista blanca.
- Dashboard diario.

## Instalación

```bash
python -m venv .venv
.venv\Scripts\activate
pip install -e .
```

Copia `.env.example` a `.env` y completa `TELEGRAM_TOKEN` y `ADMIN_CHAT_ID`.

## Ejecución

### Bot

```bash
automat bot
```

### Daemon

```bash
automat daemon
```

### GUI admin

```bash
automat gui
```

### Exportar Excel

```bash
automat export
```

### Windows, un solo clic

Usa [start_automat.bat](start_automat.bat) para abrir el bot, el daemon y la GUI a la vez.
Usa [start_gui.bat](start_gui.bat) si solo quieres abrir la ventana admin.

## Flujo recomendado

1. El bot recibe gastos, ingresos, comandos de buses y aprobaciones.
2. El daemon organiza archivos, revisa limpieza y supervisa procesos.
3. La GUI de escritorio muestra el estado completo y puede encolar acciones como wake de procesos.
4. Todo queda guardado en SQLite.
5. Excel se genera desde el historial real, no desde capturas sueltas.

## Convención de archivos

El daemon interpreta nombres como:

- `uni io temp trabajo.pdf`
- `personal recibo 2026-04.pdf`
- `universidad tesis final.docx`

La primera palabra identifica el destino, la segunda puede definir subcarpeta y `temp` marca limpieza posterior.

## Notas técnicas

- La limpieza nunca borra automáticamente.
- El supervisor de procesos usa lista blanca estricta.
- El predictor de buses empieza con estadística descriptiva; luego se puede evolucionar a modelos más formales.
