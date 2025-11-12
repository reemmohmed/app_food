class UserModel {
  String token;
  String name;
  String email;
  String? image;
  String address;
  String? visa;

  UserModel({
    required this.token,
    required this.name,
    required this.email,
    this.image,
    required this.address,
    this.visa,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json['token']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    email: json['email']?.toString() ?? '',
    image: json['image']?.toString(),
    address: json['address']?.toString() ?? 'No address set',
    visa: json['Visa']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'name': name,
    'email': email,
    'image': image,
    'address': address,
    'Visa': visa,
  };

  @override
  String toString() {
    return 'User(token: $token, name: $name, email: $email, image: $image, address: $address, visa: $visa)';
  }
}
