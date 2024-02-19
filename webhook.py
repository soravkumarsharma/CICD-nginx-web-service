from flask import Flask, request
import subprocess
import logging

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.INFO)

@app.route('/github-webhook', methods=['POST'])
def webhook():
    try:
        # Log headers and payload for debugging
        logging.info('Received headers: %s', request.headers)
        logging.info('Received payload: %s', request.get_data())

        # Update the path to your shell script
        script_path = './deployment.sh'

        # Execute the shell script
        result = subprocess.run(['bash', script_path], capture_output=True, text=True)

        # Log the result of the shell script execution
        logging.info('Shell script execution result:\n%s', result.stdout)

        return 'Webhook received and script executed successfully', 200
    except Exception as e:
        logging.error(f'Error during webhook processing: {str(e)}')
        return 'Internal server error', 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
