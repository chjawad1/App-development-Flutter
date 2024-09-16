import 'dart:io';
import 'dart:math';


List<Map<String, dynamic>> committees = [];

String generateUniqueId() {
  return Random().nextInt(10000).toString();
}


String generateRandomPassword() {
  return Random().nextInt(10000).toString();
}


void createCommittee() {
  print("Enter Committee Name:");
  String? name = stdin.readLineSync();

  print("Enter Committee Price:");
  double? price = double.tryParse(stdin.readLineSync()!);

  print("Enter Required Number of Members:");
  int? requiredMembers = int.tryParse(stdin.readLineSync()!);

  if (name == null || price == null || requiredMembers == null) {
    print("Invalid input. Committee creation failed.");
    return;
  }

  String id = generateUniqueId();
  String password = generateRandomPassword();

  Map<String, dynamic> committee = {
    'id': id,
    'name': name,
    'price': price,
    'requiredMembers': requiredMembers,
    'password': password,
    'members': []
  };

  committees.add(committee);
  print('Committee Created Successfully! ID: $id, Password: $password');
}


Map<String, dynamic> findCommitteeById(String id) {
  return committees.firstWhere(
          (committee) => committee['id'] == id,
      orElse: () => {}
  );
}


void addMember() {
  print("Enter Committee ID:");
  String? committeeId = stdin.readLineSync();

  if (committeeId == null) {
    print("Invalid Committee ID.");
    return;
  }

  var committee = findCommitteeById(committeeId);
  if (committee.isEmpty) {
    print("Committee not found.");
    return;
  }

  if (committee['members'].length >= committee['requiredMembers']) {
    print("The committee is full.");
    return;
  }

  print("Enter Member Name:");
  String? name = stdin.readLineSync();

  print("Enter Member Phone Number:");
  String? phone = stdin.readLineSync();

  print("Enter Member Email:");
  String? email = stdin.readLineSync();

  if (name == null || phone == null || email == null) {
    print("Invalid input. Failed to add member.");
    return;
  }

  Map<String, String> member = {
    'name': name,
    'phone': phone,
    'email': email
  };

  committee['members'].add(member);
  print("Member added successfully to ${committee['name']}");
}


void removeMember() {
  print("Enter Committee ID:");
  String? committeeId = stdin.readLineSync();

  if (committeeId == null) {
    print("Invalid Committee ID.");
    return;
  }

  var committee = findCommitteeById(committeeId);
  if (committee.isEmpty) {
    print("Committee not found.");
    return;
  }

  print("Enter Member Name to Remove:");
  String? memberName = stdin.readLineSync();

  if (memberName == null) {
    print("Invalid Member Name.");
    return;
  }

  committee['members'].removeWhere((member) => member['name'] == memberName);
  print("Member removed successfully from ${committee['name']}");
}

void updateMemberDetails() {
  print("Enter Committee ID:");
  String? committeeId = stdin.readLineSync();

  if (committeeId == null) {
    print("Invalid Committee ID.");
    return;
  }

  var committee = findCommitteeById(committeeId);
  if (committee.isEmpty) {
    print("Committee not found.");
    return;
  }

  print("Enter Member Name to Update:");
  String? memberName = stdin.readLineSync();

  if (memberName == null) {
    print("Invalid Member Name.");
    return;
  }

  var member = committee['members'].firstWhere((m) => m['name'] == memberName, orElse: () => null);
  if (member == null) {
    print("Member not found.");
    return;
  }

  print("Enter New Member Name (or press Enter to skip):");
  String? newName = stdin.readLineSync();

  print("Enter New Member Phone (or press Enter to skip):");
  String? newPhone = stdin.readLineSync();

  print("Enter New Member Email (or press Enter to skip):");
  String? newEmail = stdin.readLineSync();

  if (newName != null && newName.isNotEmpty) member['name'] = newName;
  if (newPhone != null && newPhone.isNotEmpty) member['phone'] = newPhone;
  if (newEmail != null && newEmail.isNotEmpty) member['email'] = newEmail;

  print("Member details updated successfully.");
}

void viewMembers() {
  print("Enter Committee ID:");
  String? committeeId = stdin.readLineSync();

  if (committeeId == null) {
    print("Invalid Committee ID.");
    return;
  }

  var committee = findCommitteeById(committeeId);
  if (committee.isEmpty) {
    print("Committee not found.");
    return;
  }

  print("Members in Committee '${committee['name']}':");
  List members = committee['members'];

  if (members.isEmpty) {
    print("No members found.");
  } else {
    for (var member in members) {
      print("- ${member['name']} (Phone: ${member['phone']}, Email: ${member['email']})");
    }
  }
}

void selectRandomMember() {
  print("Enter Committee ID:");
  String? committeeId = stdin.readLineSync();

  if (committeeId == null) {
    print("Invalid Committee ID.");
    return;
  }

  var committee = findCommitteeById(committeeId);
  if (committee.isEmpty) {
    print("Committee not found.");
    return;
  }

  List members = committee['members'];
  if (members.isEmpty) {
    print("No members in this committee.");
    return;
  }

  var selectedMember = members[Random().nextInt(members.length)];
  print("Selected Member: ${selectedMember['name']} (Phone: ${selectedMember['phone']}, Email: ${selectedMember['email']})");
}


void main() {
  while (true) {
    print("\nCommittee Management System");
    print("1. Create Committee");
    print("2. Add Member to Committee");
    print("3. Remove Member from Committee");
    print("4. Update Member Details");
    print("5. View Members in Committee");
    print("6. Select a Random Member");
    print("7. Exit");

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        createCommittee();
        break;
      case '2':
        addMember();
        break;
      case '3':
        removeMember();
        break;
      case '4':
        updateMemberDetails();
        break;
      case '5':
        viewMembers();
        break;
      case '6':
        selectRandomMember();
        break;
      case '7':
        print("Exiting...");
        exit(0);
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
