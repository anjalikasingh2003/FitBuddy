import cv2
import mediapipe as mp
import numpy as np
import time

# angle between a,b,c  (b is midpoint)
def calculate_angle(a, b, c):
    a = np.array(a)
    b = np.array(b)
    c = np.array(c)
    ab = a - b
    bc = c - b
    cosine_angle = np.dot(ab, bc) / (np.linalg.norm(ab) * np.linalg.norm(bc))
    angle = np.degrees(np.arccos(cosine_angle))
    return angle

# initialize mediapipe pose model
mp_pose = mp.solutions.pose
pose = mp_pose.Pose()
mp_draw = mp.solutions.drawing_utils

# Open the video source (0 for webcam, for mobile switch to 1 afterwards)
cap = cv2.VideoCapture(0)

count = 0
last_update_time = time.time()
stop_program = False  # Variable to track whether the program should stop

# Function to simulate a button press based on mouse click
def stop_capture(event, x, y, flags, param):
    global stop_program
    if event == cv2.EVENT_LBUTTONDOWN:
        if 250 <= x <= 350 and 420 <= y <= 470:  # Button's bounding box
            stop_program = True

# Set the mouse callback function to detect clicks on the video window
cv2.namedWindow('Pose Detection')
cv2.setMouseCallback('Pose Detection', stop_capture)

# Start capturing
while cap.isOpened() and not stop_program:
    ret, frame = cap.read()
    if not ret:
        print("Camera is unable to capture, Please adjust your position")
        continue

    # Convert frame to RGB
    img_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

    # Detect the pose landmarks
    results = pose.process(img_rgb)

    # If landmarks are detected
    if results.pose_landmarks:
        landmarks_list = []  # list for the 33 landmark coordinates
        for lm in results.pose_landmarks.landmark:
            landmarks_list.append((lm.x, lm.y, lm.z))
        
        # Calculate angles and distances required for pose correctness checks
        diff = abs(landmarks_list[25][2] - landmarks_list[26][2])
        ang_l = calculate_angle(landmarks_list[11], landmarks_list[13], landmarks_list[15])
        ang_r = calculate_angle(landmarks_list[12], landmarks_list[14], landmarks_list[16])

        # Correct pose condition: based on angles and positions of landmarks
        if ((landmarks_list[23][1] < landmarks_list[30][1] < landmarks_list[25][1] or landmarks_list[24][1] < landmarks_list[29][1] < landmarks_list[26][1])
            and diff <= 0.3
            and (120 <= ang_l <= 165)
            and (120 <= ang_r <= 165)):
            msg = "Correct Pose"

            # Increment count every second if the pose is correct
            if time.time() - last_update_time >= 1:
                count += 1
                last_update_time = time.time()
        else:
            msg = "fix pose"
        if (landmarks_list[23][1] < landmarks_list[30][1] < landmarks_list[25][1] or landmarks_list[24][1] < landmarks_list[29][1] < landmarks_list[26][1]) == False:
            msg = msg + " | lift up your either foot"
        if (120 <= ang_l <= 165) == False:
            msg = msg + " | straighten your left hand"
        if (120 <= ang_r <= 165) == False:
            msg = msg + " | straighten your right hand"
        
        

        # Draw pose landmarks on the frame
        mp_draw.draw_landmarks(frame, results.pose_landmarks, mp_pose.POSE_CONNECTIONS)

        # Display the message and count on the video frame
        cv2.putText(frame, msg, (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
        cv2.putText(frame, f'Count: {count}', (10, 70), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)

    # Draw the simulated "Stop" button on the video frame
    cv2.rectangle(frame, (250, 420), (350, 470), (0, 0, 255), -1)  # Red button
    cv2.putText(frame, 'Stop', (265, 455), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2)

    # Show the video feed
    cv2.imshow('Pose Detection', frame)

    # Check if 'q' is pressed or stop button clicked
    if cv2.waitKey(10) & 0xFF == ord('q'):
        break

# Release the video capture
cap.release()
cv2.destroyAllWindows()