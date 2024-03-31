import json
import requests
import os

# Define GitHub token and headers
headers = {
    'Authorization': 'token GITHUB_TOKEN',  # Replace GITHUB_TOKEN with actual GitHub token
    'Accept': 'application/vnd.github.v3.raw',
}

# Define the API URL and save directory
api_url = 'https://api.github.com/repos/statsbomb/open-data/git/trees/0067cae166a56aa80b2ef18f61e16158d6a7359a?recursive=1'
save_dir = r'C:\Users\path\to_Desired_Directory'  # Replace with your desired save directory


# Function to extract match IDs from a local JSON file
def get_match_ids(json_data):
    return [item["match_id"] for item in json_data]


# Load the match IDs from a local file, essentially get the matches for the according season
with open(r'C:\Users\path\to_Desired_Directory\PL-2003-2004-matches.json', 'r', encoding='utf-8') as file:
    json_data = json.load(file)

# Extract the match IDs
match_ids = get_match_ids(json_data)

# Fetch the directory content from GitHub
response = requests.get(api_url, headers=headers)
data = response.json()

# Ensure the save directory exists
if not os.path.exists(save_dir):
    os.makedirs(save_dir)

# Download files that match the extracted match IDs
for item in data.get('tree', []):
    file_path = item['path']
    if file_path.startswith('data/lineups/') and file_path.endswith('.json'):
        # Extract just the match ID part of the filename
        match_id = file_path.split('/')[-1].split('.')[0]

        # Check if the extracted match ID is in our list of IDs
        if int(match_id) in match_ids:
            # Construct the raw GitHub URL
            raw_url = f'https://raw.githubusercontent.com/statsbomb/open-data/0067cae166a56aa80b2ef18f61e16158d6a7359a/{file_path}'

            # Download the file
            response = requests.get(raw_url, headers=headers)
            if response.status_code == 200:
                file_name = file_path.split('/')[-1]
                file_save_path = os.path.join(save_dir, file_name)
                with open(file_save_path, 'wb') as file:
                    file.write(response.content)
                print(f'Downloaded {file_name}')
            else:
                print(f'Failed to download {file_path}')