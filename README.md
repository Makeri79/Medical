# Medical
COVID Symptom Checker

	Overview
This program is a simple COVID symptom checker written in Prolog. It allows users to input symptoms, perform a temperature check, and conduct a basic checkup to determine if the symptoms match those of COVID-19.

	Features

1. **Add Symptom:**
   - Users can input COVID symptoms, and the program will record them.

2. **Display Symptoms:**
   - Displays a list of recorded COVID symptoms.

3. **Check Symptom:**
   - Users can check if a specific symptom is associated with COVID.

4. **Temperature Check:**
   - Performs a temperature check and indicates whether the patient has a fever.

5. **Perform Checkup:**
   - Conducts a checkup based on predefined rules to determine if the symptoms align with COVID.
	Usage

- Run the program and choose options from the menu.
- Input symptoms, perform checks, and receive advice based on the symptoms entered.
	How to Run

1. Load the Prolog file.
2. Call the `menu.` predicate to start the program.
3. Follow the on-screen instructions to navigate through the menu options.

	 Example Usage

```prolog
?- menu.
1 => add symptom:
2 => display symptoms.
3 => check symptom.
4 => do temperature check *C.
5 => perform checkup.

Enter choice: 1
Enter symptom: cough
Enter another (y/n) ? y

Enter symptom: fever
Symptom already recorded
Enter another (y/n) ? n
1 => add symptom:
2 => display symptoms.
3 => check symptom.
4 => do temperature check *C.
5 => perform checkup.

Enter choice: 2
A covid symptom is cough
A covid symptom is fever


