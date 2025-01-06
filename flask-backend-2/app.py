from flask import Flask, jsonify
from flask_cors import CORS
import subprocess

app = Flask(__name__)
CORS(app)

# Route for Jumping Jacks
@app.route('/jumpingjacks', methods=['POST'])  # Change to POST
def jumping_jacks():
    try:
        result = subprocess.run(['python3', 'exercises/jumpingjacks.py'],
                                check=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)

        return result.stdout.decode(), 200
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e.stderr.decode()}", 500
    except FileNotFoundError:
        return "Python interpreter not found", 500

# Route for Squats
@app.route('/squats', methods=['POST'])  # Change to POST if needed
def squats():
    try:
        result = subprocess.run(['python3', 'exercises/squats.py'],
                                check=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)

        return result.stdout.decode(), 200
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e.stderr.decode()}", 500
    except FileNotFoundError:
        return "Python interpreter not found", 500

# Route for Pushups
@app.route('/pushups', methods=['POST'])  # Change to POST if needed
def pushups():
    try:
        result = subprocess.run(['python3', 'exercises/pushups.py'],
                                check=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)

        return result.stdout.decode(), 200
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e.stderr.decode()}", 500
    except FileNotFoundError:
        return "Python interpreter not found", 500

# Route to start the full workout in sequence
@app.route('/fullworkout', methods=['POST'])  # Change to POST if needed
def full_workout():
    try:
        # Start with Jumping Jacks
        subprocess.run(['python3', 'exercises/jumpingjacks.py'], check=True)
        
        # Move to Pushups after Jumping Jacks
        subprocess.run(['python3', 'exercises/pushups.py'], check=True)
        
        # Finish with Squats
        subprocess.run(['python3', 'exercises/squats.py'], check=True)

        return jsonify({"status": "success", "message": "Full workout completed"}), 200
    except subprocess.CalledProcessError as e:
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002, debug=True)
