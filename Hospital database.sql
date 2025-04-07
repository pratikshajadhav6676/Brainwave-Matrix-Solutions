CREATE DATABASE HospitalDB;
USE HospitalDB;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Age INT,
    Gender NVARCHAR(10),
    Address NVARCHAR(255),
    Contact NVARCHAR(15),
    Disease NVARCHAR(100)
);
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Specialization NVARCHAR(100),
    Contact NVARCHAR(15)
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status NVARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE Bills (
    BillID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10,2),
    PaymentStatus NVARCHAR(50),
    BillDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Price DECIMAL(10,2)
);
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    MedicationID INT,
    Dosage NVARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomType NVARCHAR(50),
    Status NVARCHAR(50)
);
INSERT INTO Patients VALUES
(1, 'John Doe', 45, 'Male', '123 Street, NY', '1234567890', 'Flu'),
(2, 'Jane Smith', 30, 'Female', '456 Avenue, LA', '0987654321', 'Covid-19'),
(3, 'Robert Brown', 55, 'Male', '789 Road, TX', '1122334455', 'Diabetes'),
(4, 'Emily Davis', 40, 'Female', '159 Lane, FL', '2233445566', 'Hypertension'),
(5, 'Michael Wilson', 60, 'Male', '753 Blvd, OH', '3344556677', 'Asthma'),
(6, 'Sarah Lee', 28, 'Female', '369 Street, WA', '4455667788', 'Migraine'),
(7, 'David Clark', 35, 'Male', '741 Drive, CO', '5566778899', 'Fracture'),
(8, 'Emma Johnson', 50, 'Female', '852 Road, IL', '6677889900', 'Arthritis');

INSERT INTO Doctors VALUES
(1, 'Dr. Smith', 'Cardiologist', '1112223334'),
(2, 'Dr. Brown', 'Neurologist', '2223334445'),
(3, 'Dr. Johnson', 'Orthopedic', '3334445556'),
(4, 'Dr. Lee', 'General Physician', '4445556667'),
(5, 'Dr. White', 'Pediatrician', '5556667778'),
(6, 'Dr. Black', 'Surgeon', '6667778889'),
(7, 'Dr. Green', 'Dermatologist', '7778889990'),
(8, 'Dr. Adams', 'ENT Specialist', '8889990001');

INSERT INTO Appointments VALUES
(1, 1, 1, '2025-03-10', 'Completed'),
(2, 2, 2, '2025-03-12', 'Scheduled'),
(3, 3, 3, '2025-03-15', 'Cancelled'),
(4, 4, 4, '2025-03-17', 'Completed'),
(5, 5, 5, '2025-03-20', 'Scheduled'),
(6, 6, 6, '2025-03-22', 'Completed'),
(7, 7, 7, '2025-03-25', 'Scheduled'),
(8, 8, 8, '2025-03-27', 'Completed');

INSERT INTO Bills VALUES
(1, 1, 200.00, 'Paid', '2025-03-11'),
(2, 2, 500.00, 'Unpaid', '2025-03-13'),
(3, 3, 150.00, 'Paid', '2025-03-16'),
(4, 4, 300.00, 'Unpaid', '2025-03-18'),
(5, 5, 400.00, 'Paid', '2025-03-21'),
(6, 6, 600.00, 'Unpaid', '2025-03-23'),
(7, 7, 250.00, 'Paid', '2025-03-26'),
(8, 8, 350.00, 'Unpaid', '2025-03-28');

INSERT INTO Medications VALUES
(1, 'Paracetamol', 10.00),
(2, 'Ibuprofen', 15.00),
(3, 'Amoxicillin', 20.00),
(4, 'Cetirizine', 8.00),
(5, 'Metformin', 25.00),
(6, 'Atorvastatin', 30.00),
(7, 'Losartan', 40.00),
(8, 'Omeprazole', 18.00);

INSERT INTO Prescriptions VALUES
(1, 1, 1, 1, '500mg once daily'),
(2, 2, 2, 2, '200mg twice daily'),
(3, 3, 3, 3, '250mg thrice daily'),
(4, 4, 4, 4, '10mg once daily'),
(5, 5, 5, 5, '50mg twice daily'),
(6, 6, 6, 6, '20mg once daily'),
(7, 7, 7, 7, '100mg twice daily'),
(8, 8, 8, 8, '150mg once daily');

INSERT INTO Rooms VALUES
(1, 'ICU', 'Occupied'),
(2, 'General', 'Available'),
(3, 'Private', 'Occupied'),
(4, 'Semi-Private', 'Available'),
(5, 'ICU', 'Available'),
(6, 'General', 'Occupied'),
(7, 'Private', 'Available'),
(8, 'Semi-Private', 'Occupied');

-- 1. Retrieve all patient details
SELECT * FROM Patients;

-- 2. Get all doctors specializing in Neurology
SELECT * FROM Doctors WHERE Specialization = 'Neurologist';

-- 3. List all upcoming appointments
SELECT * FROM Appointments WHERE Status = 'Scheduled';

-- 4. Retrieve total revenue from bills
SELECT SUM(Amount) AS TotalRevenue 
FROM Bills 
WHERE PaymentStatus = 'Paid';

-- 5. Find patients with unpaid bills
SELECT P.Name, B.Amount FROM Patients P 
JOIN Bills B ON P.PatientID = B.PatientID 
WHERE B.PaymentStatus = 'Unpaid';

-- 6. Count total number of patients
SELECT COUNT(*) AS TotalPatients FROM Patients;

-- 7. Get the most expensive medication
SELECT TOP 1 * FROM Medications ORDER BY Price DESC;

-- 8. Retrieve prescriptions for a specific patient
SELECT * FROM Prescriptions WHERE PatientID = 3;

-- 9. List available rooms
SELECT * FROM Rooms WHERE Status = 'Available';

-- 10. Count appointments per doctor
SELECT DoctorID, COUNT(*) AS TotalAppointments 
FROM Appointments 
GROUP BY DoctorID;

-- 11. Retrieve details of patients over 50 years old
SELECT * FROM Patients WHERE Age > 50;

-- 12. Find the doctor assigned to a specific appointment
SELECT D.* FROM Doctors D 
JOIN Appointments A ON D.DoctorID = A.DoctorID 
WHERE A.AppointmentID = 2;

-- 13. Get patients prescribed a specific medication
SELECT P.* FROM Patients P 
JOIN Prescriptions PR ON P.PatientID = PR.PatientID 
WHERE PR.MedicationID = 1;

-- 14. Count total rooms per type
SELECT RoomType, COUNT(*) AS RoomCount FROM Rooms GROUP BY RoomType;

-- 15. List all completed appointments
SELECT * FROM Appointments WHERE Status = 'Completed';

-- 16. Get the total number of bills generated
SELECT COUNT(*) AS TotalBills FROM Bills;

-- 17. List all patients with Asthma
SELECT * FROM Patients WHERE Disease = 'Asthma';

-- 18. Find total expenditure on medications
SELECT SUM(Price) AS TotalExpenditure FROM Medications;

-- 19. Retrieve all unpaid bills with due amounts
SELECT * FROM Bills WHERE PaymentStatus = 'Unpaid';

-- 20. Get the patient who had the most appointments
SELECT TOP 1 PatientID, COUNT(*) AS AppointmentCount 
FROM Appointments 
GROUP BY PatientID 
ORDER BY AppointmentCount DESC;






