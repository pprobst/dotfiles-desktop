from pixivpy3 import *

# This script basically fetches all the user IDs from everyone
# that "inputID" follows on Pixiv.

inputID = input("ID: ")

api = AppPixivAPI()
# insert username and password here
api.login("myUsername", "myPassword")

json_result = api.user_following(inputID)

id_list = []

print("Fetching IDs...")

while True:
    user_prevs = json_result['user_previews']
    for user_prev in user_prevs:
        id_list.append(str(user_prev.user.id))

    next_url = json_result['next_url']
    next_qs = api.parse_qs(next_url)
    if next_qs == None:
        break
    json_result = api.user_following(**next_qs)

print("Done!")
print("{} IDs fetched.".format(len(id_list)))

with open('id_list', 'w') as f:
    for ID in id_list:
        f.write(ID + " ")