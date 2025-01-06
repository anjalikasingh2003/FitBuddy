import cv2
import math
from tkinter import *
from PIL import Image, ImageTk
import mediapipe as md

# Importing necessary libraries
md_drawing = md.solutions.drawing_utils
md_drawing_style = md.solutions.drawing_styles
md_pose = md.solutions.pose

count = 0
position = None

cap = cv2.VideoCapture(0)

# Initializing variables and capturing video
root = Tk()
root.title("JUMPING JACK")
root.geometry('500x400+268+82')
root.configure(bg="#000000")  # Set background color to black

# Creating the Tkinter window
f1 = LabelFrame(root, bg="#000000")  # Change label frame background to black
f1.place(relx=0.5, rely=0.5, anchor='center')

label = Label(root, text="Jumping Jack Count: 0", font=("Arial", 24, "bold"), bg="#000000", fg="#FFFFFF")  # Update label colors
label.pack(pady=10)

# Creating a label for displaying video
video_label = Label(root, bg="#000000")  # Set background to black
video_label.pack()

def close():
    root.destroy()

# Function to close the application
exit_button = Button(f1, text="Exit the Application", bg='#FFFFFF', fg='red', font=("Calibri", 14, "bold"), command=close)
exit_button.place(relx=0.5, rely=0.9, anchor="center")  # Center the exit button towards the bottom of the frame

# Initializing the Pose object for pose estimation
pose = md_pose.Pose(
    min_detection_confidence=0.5,
    min_tracking_confidence=0.7
)

def update_jump():
    global count
    label.config(text=f"Jumping Jack Count: {count}")
    label.after(1000, update_jump)

# Function to update the jumping jack count every second
def process_frame():
    global position, count

    success, image = cap.read()
    if not success:
        print("Empty Camera")
        return

    image = cv2.cvtColor(cv2.flip(image, 1), cv2.COLOR_BGR2RGB)
    result = pose.process(image)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    imlist = []

    if result.pose_landmarks:
        md_drawing.draw_landmarks(
            image, result.pose_landmarks, md_pose.POSE_CONNECTIONS,
            landmark_drawing_spec=md_drawing_style.get_default_pose_landmarks_style()
        )
        for id, im in enumerate(result.pose_landmarks.landmark):
            h, w, _ = image.shape
            X, Y = int(im.x * w), int(im.y * h)
            imlist.append([id, X, Y])

    if len(imlist) != 0:
        if imlist[12][2] and imlist[11][2] >= imlist[14][2] and imlist[13][2]:
            position = "down"
        if imlist[12][2] and imlist[11][2] < imlist[14][2] and imlist[13][2] and position == "down":
            position = "up"
            count += 1
            print(count)

    frame = ImageTk.PhotoImage(Image.fromarray(image))
    video_label.config(image=frame)
    video_label.image = frame

    root.after(1, process_frame)

update_jump()
process_frame()

# Updating the jumping jack count and processing video frames
root.mainloop()

cap.release()
cv2.destroyAllWindows()
