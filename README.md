# FitBuddy: Your AI-Powered Fitness Companion – Personalized Plans, Real-Time Tracking, and Guided Workouts for a Healthier You!
## Inspiration  
The idea for *FitBuddy* stemmed from the challenges we face during workouts: manually tracking repetitions, ensuring correct posture, and designing workout plans tailored to specific goals. These tasks are not only inconvenient but also divert focus from the exercise itself. We envisioned a solution that eliminates these hurdles, helping individuals focus entirely on their form and progress while providing real-time guidance and customized fitness plans.

## What It Does  
*FitBuddy* is an AI-powered fitness companion that enhances your workout experience:  
- *Automatically counts repetitions*, allowing users to focus entirely on their form and progress.  
- *Provides real-time feedback* for yoga poses, helping users correct their posture with precision.  
- Includes an *AI Chat Assistant* that designs customized fitness plans based on personal fitness goals and preferences.  

## How We Built It  
FitBuddy was created using a combination of cutting-edge technologies and tools to deliver an intuitive and efficient fitness experience:  
- *Frontend Development: The user interface was built using *Flutter, ensuring a seamless experience across devices.  
- *Backend Development: We used *Python with *Flask* to create APIs that integrate exercise tracking and yoga pose analysis.  
- *Pose Estimation: Libraries like **MediaPipe* and *OpenCV* were employed to enable real-time pose tracking and exercise counting.  
- *AI Chatbot: To power the chatbot, we integrated **OpenAI services via Azure*, leveraging state-of-the-art GPT models for creating personalized fitness plans and responding intelligently to user queries.  
- *GitHub Copilot*: This tool significantly streamlined our development process, assisting with code generation and debugging for key components such as pose tracking algorithms and API integrations.  
- *Cloud Integration*: Azure not only hosted the OpenAI services but also provided scalability for chatbot functionality, ensuring smooth performance.  

## Challenges We Ran Into  
- *Python-Flutter Integration*: Establishing smooth communication between the Flask backend and Flutter frontend, especially on mobile devices, was challenging. Running the Flask server on mobile devices initially caused issues.  
- *Pose Estimation*: Identifying libraries that provided accurate pose detection for yoga and exercises required extensive research and testing.  
- *Exercise Counting*: Developing custom algorithms for accurate counting demanded multiple iterations to ensure precise feedback.  
- *AI Integration*: Incorporating Azure’s OpenAI services for the chatbot posed difficulties, but GitHub Copilot provided valuable assistance in overcoming technical hurdles.  

## Accomplishments That We’re Proud Of  
- Successfully integrating real-time pose detection and exercise counting.  
- Delivering an *AI-powered fitness chatbot* that personalizes fitness plans.  
- Creating a seamless user experience by combining cutting-edge AI and intuitive design.  
- Overcoming significant technical challenges and achieving a functional cross-platform solution.  

## What We Learned  
- The importance of efficient Python-Flutter integration for cross-platform applications.  
- The intricacies of pose estimation and the nuances of exercise tracking algorithms.  
- Leveraging tools like GitHub Copilot to expedite AI development and resolve complex coding challenges.  
- Effective collaboration and iterative development to refine and improve features.  

## What’s Next for FitBuddy  
- Expanding compatibility to make FitBuddy accessible across more devices and platforms.  
- Adding a broader range of workout and yoga plans to cater to diverse user needs.  
- Incorporating *advanced AI models* to provide even more accurate feedback and personalized fitness insights.  
- Exploring *wearable device integration* for enhanced tracking and feedback during workouts.  

FitBuddy is not just a fitness app; it’s a step toward making health and fitness accessible, intelligent, and user-friendly for everyone. For more details about our project, visit our [GitHub repository](https://github.com/anjalikasingh2003/FitBuddy.git).

## Project description
A fitness app that provides user with personalized workout selection, and offers the flexibility to choose between workouts and yoga sessions, while accurately counting your exercise repetitions and timing your poses in real time. <br/>
Used Computer Vision to accurately count the repetitions of exercise in realtime.
## Setup Instructions
1. Ensure that you have latest version of Python and Flutter installed on your device.
2. Clone the repository
   ```
   git clone https://github.com/anjalikasingh2003/FitFlow.git
   ```
3. Install the following python libraries
   ```
   pip install mediapipe
   pip install opencv
   pip install tkinter
   pip install numpy
   ```
4. Run the following command to install dependencies
   ```
   flutter pub get
   ```
5. Run the application
   ```
   flutter run
   ```


