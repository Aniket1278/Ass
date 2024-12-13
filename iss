
public class Student {
	   int student_id; 
	    String name; 
	     
	    int roll_no; 
	    String className; 
	    double marks; 
	    String address; 
	 
	    public Student(int student_id, String name, int roll_no, String className, double 
	marks, String address) { 
	        this.student_id = student_id; 
	        this.name = name; 
	        this.roll_no = roll_no; 
	        this.className = className; 
	        this.marks = marks; 
	        this.address = address; 
	    } 
	 
	    @Override 
	    public String toString() { 
	        return "Student ID: " + student_id + "\nName: " + name + "\nRoll No: " + roll_no + 
	"\nClass: " + className 
	                + "\nMarks: " + marks + "\nAddress: " + address + "\n"; 
	    }
}
import java.io.*;
import java.util.*;

public class StudentDatabase {
	  private static final String FILENAME = "student_records.txt"; 
	    private static List<Student> studentList = new ArrayList<>(); 
	 
	    public static void main(String[] args) { 
	        readDataFromFile(); 
	        Scanner scanner = new Scanner(System.in); 
	 
	        while (true) { 
	            System.out.println("1. Add Student"); 
	            System.out.println("2. Display All Students"); 
	            System.out.println("3. Search Student"); 
	            System.out.println("4. Update Student"); 
	            System.out.println("5. Delete Student"); 
	            System.out.println("6. Exit"); 
	            System.out.print("Enter your choice: "); 
	 
	            int choice = scanner.nextInt(); 
	 
	            switch (choice) { 
	                case 1: 
	                    addStudent(scanner); 
	                    break; 
	                case 2: 
	                    displayAllStudents(); 
	                    break; 
	                case 3: 
	                    searchStudent(scanner); 
	                    break; 
	                case 4: 
	                    updateStudent(scanner); 
	                    break; 
	                case 5: 
	                    deleteStudent(scanner); 
	                    break; 
	                case 6: 
	                    writeDataToFile(); 
	                    System.out.println("Goodbye!"); 
	                    System.exit(0); 
	                    break; 
	                default: 
	                    System.out.println("Invalid choice. Please enter a valid option."); 
	            } 
	        } 
	    } 
	 
	    private static void addStudent(Scanner scanner) { 
	        System.out.print("Enter Student ID: "); 
	        int student_id = scanner.nextInt(); 
	        scanner.nextLine();  // Consume the newline character 
	        System.out.print("Enter Student Name: "); 
	        String name = scanner.nextLine(); 
	        System.out.print("Enter Roll No: "); 
	        int roll_no = scanner.nextInt(); 
	        scanner.nextLine();  // Consume the newline character 
	        System.out.print("Enter Class: "); 
	        String className = scanner.nextLine(); 
	        System.out.print("Enter Marks: "); 
	        double marks = scanner.nextDouble(); 
	        scanner.nextLine();  // Consume the newline character 
	        System.out.print("Enter Address: "); 
	        String address = scanner.nextLine(); 
	 
	        Student student = new Student(student_id, name, roll_no, className, marks, 
	address); 
	        studentList.add(student); 
	        System.out.println("Student added successfully."); 
	    } 
	 
	    private static void displayAllStudents() { 
	        if (studentList.isEmpty()) { 
	            System.out.println("No students in the database."); 
	        } else { 
	            for (Student student : studentList) { 
	                System.out.println(student); 
	            } 
	        } 
	    } 
	 
	    private static void searchStudent(Scanner scanner) { 
	        System.out.print("Enter Student ID to search: "); 
	        int student_id = scanner.nextInt(); 
	        boolean found = false; 
	 
	        for (Student student : studentList) { 
	            if (student.student_id == student_id) { 
	                System.out.println("Student Found:\n" + student); 
	                found = true; 
	                break; 
	            } 
	        } 
	 
	        if (!found) { 
	            System.out.println("Student not found."); 
	        } 
	    } 
	 
	    private static void updateStudent(Scanner scanner) { 
	        System.out.print("Enter Student ID to update: "); 
	        int student_id = scanner.nextInt(); 
	        boolean found = false; 
	 
	        for (Student student : studentList) { 
	            if (student.student_id == student_id) { 
	                scanner.nextLine();  // Consume the newline character 
	                System.out.print("Enter new Student Name: "); 
	                String name = scanner.nextLine(); 
	                System.out.print("Enter new Roll No: "); 
	                int roll_no = scanner.nextInt(); 
	                scanner.nextLine();  // Consume the newline character 
	                System.out.print("Enter new Class: "); 
	                String className = scanner.nextLine(); 
	                System.out.print("Enter new Marks: "); 
	                double marks = scanner.nextDouble(); 
	                scanner.nextLine();  // Consume the newline character 
	                System.out.print("Enter new Address: "); 
	                String address = scanner.nextLine(); 
	 
	                student.name = name; 
	                student.roll_no = roll_no; 
	                student.className = className; 
	                student.marks = marks; 
	                student.address = address; 
	 
	                System.out.println("Student information updated."); 
	                found = true; 
	                break; 
	            } 
	        } 
	 
	        if (!found) { 
	            System.out.println("Student not found."); 
	        } 
	    } 
	 
	    private static void deleteStudent(Scanner scanner) { 
	        System.out.print("Enter Student ID to delete: "); 
	        int student_id = scanner.nextInt(); 
	        Iterator<Student> iterator = studentList.iterator(); 
	        boolean found = false; 
	 
	        while (iterator.hasNext()) { 
	            Student student = iterator.next(); 
	            if (student.student_id == student_id) { 
	                iterator.remove(); 
	                System.out.println("Student deleted."); 
	                found = true; 
	                break; 
	            } 
	        } 
	 
	        if (!found) { 
	            System.out.println("Student not found."); 
	        } 
	    } 
	 
	    private static void readDataFromFile() { 
	        try { 
	            BufferedReader reader = new BufferedReader(new FileReader(FILENAME)); 
	            String line; 
	            while ((line = reader.readLine()) != null) { 
	                String[] data = line.split(","); 
	                int student_id = Integer.parseInt(data[0]); 
	                String name = data[1]; 
	                int roll_no = Integer.parseInt(data[2]); 
	                String className = data[3]; 
	                double marks = Double.parseDouble(data[4]); 
	                String address = data[5]; 
	                Student student = new Student(student_id, name, roll_no, className, 
	marks, address); 
	                studentList.add(student); 
	            } 
	            reader.close(); 
	        } catch (IOException e) { 
	            // Handle exceptions 
	        } 
	    } 
	 
	    private static void writeDataToFile() { 
	        try { 
	            BufferedWriter writer = new BufferedWriter(new FileWriter(FILENAME)); 
	            for (Student student : studentList) { 
	                writer.write(student.student_id + "," + student.name + "," + student.roll_no + student.className + "," + student.marks + "," + student.address); 
	                writer.newLine(); 
	            } 
	            writer.close(); 
	        } catch (IOException e) { 
	            // Handle exceptions 
	        } 
	    } 
}
