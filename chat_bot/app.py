from flask import Flask, request, jsonify
import os
from openai import AzureOpenAI
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Azure OpenAI Setup
endpoint = os.getenv("ENDPOINT_URL", "https://anjal-m5jnfaz4-eastus2.openai.azure.com/")
deployment = os.getenv("DEPLOYMENT_NAME", "gpt-4")
subscription_key = os.getenv("AZURE_OPENAI_API_KEY", "5tVSLcXinqEakDXqXUizhvCzEWNbPHJpDWpYsovquVhaB9zQBt5VJQQJ99BAACHYHv6XJ3w3AAAAACOGMYyG")

client = AzureOpenAI(
    azure_endpoint=endpoint,
    api_key=subscription_key,
    api_version="2024-05-01-preview",
)

@app.route('/chat', methods=['POST'])
def chat():
    user_message = request.json.get("message", "")
    if not user_message:
        return jsonify({"error": "Message is required"}), 400

    # Prepare messages for OpenAI
    messages = [
        {"role": "system", "content": "You are Fit Buddy, a fitness and wellness assistant."},
        {"role": "user", "content": user_message}
    ]

    try:
        # Generate response
        completion = client.chat.completions.create(
            model=deployment,
            messages=messages,
            max_tokens=800,
            temperature=0.7,
            top_p=0.95,
            frequency_penalty=0,
            presence_penalty=0,
        )
        print(completion)
        response = completion.choices[0].message.content
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(port=5005, debug=True)