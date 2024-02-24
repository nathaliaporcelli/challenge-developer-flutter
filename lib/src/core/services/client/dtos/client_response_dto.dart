class ClientResponseDTO {
  final int statusCode;
  final Map<String, dynamic> body;

  const ClientResponseDTO({
    required this.statusCode,
    required this.body,
  });
}
