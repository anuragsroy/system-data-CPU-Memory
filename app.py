from flask import Flask, jsonify
import psutil
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # allow frontend JS calls

@app.route("/metrics", methods=["GET"])
def metrics():
    cpu = psutil.cpu_percent(interval=1)

    memory = psutil.virtual_memory()

    return jsonify({
        "cpu_usage": cpu,
        "memory": {
            "total": round(memory.total / (1024 * 1024), 2),
            "used": round(memory.used / (1024 * 1024), 2),
            "available": round(memory.available / (1024 * 1024), 2),
            "usage_percent": memory.percent
        }
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
