from flask import Flask, jsonify
from flask_cors import CORS
import subprocess

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes
CORS(app, resources={r"/*": {"origins": "*"}})  # Allow all origins for all routes


# Route for Jumping Jacks
@app.route('/jumpingjacks', methods=['GET'])
def jumping_jacks():
    try:
        result = subprocess.run(['python3', 'exercises/jumpingjacks.py'], 
                                check=True, 
                                stdout=subprocess.PIPE, 
                                stderr=subprocess.PIPE)

        # If the script runs successfully, return the output
        return result.stdout.decode(), 200
    except subprocess.CalledProcessError as e:
        return f"An error occurred: {e.stderr.decode()}", 500
    except FileNotFoundError:
        return "Python interpreter not found", 500


# Route for Squats
@app.route('/squats', methods=['GET'])
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
@app.route('/pushups', methods=['GET'])
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
@app.route('/fullworkout', methods=['GET'])
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
    app.run(host='0.0.0.0', port=5001, debug=True)
