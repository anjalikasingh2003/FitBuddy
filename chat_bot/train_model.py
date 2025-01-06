# import tensorflow as tf
# from tensorflow.keras.models import Sequential
# from tensorflow.keras.layers import Embedding, LSTM, Dense
# from tensorflow.keras.preprocessing.text import Tokenizer
# from tensorflow.keras.preprocessing.sequence import pad_sequences
# import pickle

# # Sample training data
# queries = [
#     "I want to lose weight", "How do I gain muscle?", 
#     "Help me with endurance", "I need better flexibility", 
#     "Just want to maintain fitness"
# ]
# labels = [0, 1, 2, 3, 4]  # Encoded fitness goals

# # Tokenizer and preprocessing
# tokenizer = Tokenizer(num_words=1000)
# tokenizer.fit_on_texts(queries)
# sequences = tokenizer.texts_to_sequences(queries)
# padded = pad_sequences(sequences, maxlen=10)

# # Save the tokenizer
# with open('tokenizer.pkl', 'wb') as f:
#     pickle.dump(tokenizer, f)

# # Build the LSTM model
# model = Sequential([
#     Embedding(1000, 64, input_length=10),
#     LSTM(32),
#     Dense(5, activation='softmax')
# ])

# # Compile and train the model
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
# model.fit(padded, labels, epochs=10)

# # Save the trained model
# model.save('fitness_classifier.h5')
# print("Model trained and saved successfully.")
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, LSTM, Dense
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
import pickle
import numpy as np

# Sample training data
queries = [
    "I want to lose weight", "How do I gain muscle?", 
    "Help me with endurance", "I need better flexibility", 
    "Just want to maintain fitness"
]
labels = [0, 1, 2, 3, 4]  # Encoded fitness goals

# Tokenizer and preprocessing
tokenizer = Tokenizer(num_words=1000)
tokenizer.fit_on_texts(queries)
sequences = tokenizer.texts_to_sequences(queries)
padded = pad_sequences(sequences, maxlen=10)

# Convert padded sequences and labels to numpy arrays
padded = np.array(padded)
labels = np.array(labels)

# Save the tokenizer
with open('tokenizer.pkl', 'wb') as f:
    pickle.dump(tokenizer, f)

# Print the shapes and types for debugging
print("Padded shape:", padded.shape)
print("Padded type:", type(padded))
print("Labels shape:", labels.shape)
print("Labels type:", type(labels))

# Build the LSTM model
model = Sequential([
    Embedding(1000, 64, input_length=10),
    LSTM(32),
    Dense(5, activation='softmax')
])

# Compile and train the model
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
model.fit(padded, labels, epochs=10)

# Save the trained model
model.save('fitness_classifier.h5')
print("Model trained and saved successfully.")
