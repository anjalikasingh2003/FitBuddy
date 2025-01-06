from flask import Flask, jsonify
from flask_cors import CORS
import subprocess

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route('/Tree_pose', methods=['GET'])
def tree_pose():
    try:
        # Run the Tree_pose.py script
        result = subprocess.run(
            ['python3', 'yoga_poses/Tree_pose.py'], 
            check=True, 
            stdout=subprocess.PIPE, 
            stderr=subprocess.PIPE
        )

        # Return the script's output in JSON format
        return jsonify({"status": "success", "output": result.stdout.decode()}), 200

    except subprocess.CalledProcessError as e:
        # Return detailed error if the script fails
        return jsonify({"status": "error", "error": e.stderr.decode()}), 500

    except FileNotFoundError:
        # Handle case where Python interpreter or script is not found
        return jsonify({"status": "error", "error": "Python interpreter or script not found"}), 500

if __name__ == '__main__':
    # Run the Flask app
    app.run(host='0.0.0.0', port=5004, debug=True)
