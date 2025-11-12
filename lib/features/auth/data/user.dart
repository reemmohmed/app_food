class User {
  String token;
  String name;
  String email;
  String? image;
  dynamic address;
  dynamic visa;

  User({
    required this.token,
    required this.name,
    required this.email,
    this.image,
    this.address,
    this.visa,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    token: json['token'] as String? ?? '', // ✅ يمنع null error
    name: json['name'] as String? ?? '',
    email: json['email'] as String? ?? '',
    image: json['image'] as String?,
    address: json['address'],
    visa: json['visa'],
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'name': name,
    'email': email,
    'image': image,
    'address': address,
    'visa': visa,
  };
  @override
  String toString() {
    return 'User(token: $token, name: $name, email: $email, image: $image, address: $address, visa: $visa)';
  }
}
