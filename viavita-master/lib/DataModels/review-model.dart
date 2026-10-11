class Review {
  final int customerId;
  final int rating;
  final String review;
  final String createdDate;

  Review({
    required this.customerId,
    required this.rating,
    required this.review,
    required this.createdDate,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      // Safely handle if API sends "123" (String) or 123 (Int)
      customerId: int.tryParse(json['customer_id'].toString()) ?? 0,
      rating: int.tryParse(json['rating'].toString()) ?? 0,
      review: json['review']?.toString() ?? '',
      createdDate: json['created_date']?.toString() ?? '',
    );
  }
}

class WorkerResponse {
  final bool status;
  final String workerId;
  final String averageRating;
  final int totalReviews;
  final List<Review> reviews;

  WorkerResponse({
    required this.status,
    required this.workerId,
    required this.averageRating,
    required this.totalReviews,
    required this.reviews,
  });

  factory WorkerResponse.fromJson(Map<String, dynamic> json) {
    return WorkerResponse(
      status: json['status'] ?? false,
      // FIX: Use .toString() to prevent crash if API sends an int (e.g. 55)
      workerId: json['worker_id']?.toString() ?? "0",
      // FIX: Use .toString() to prevent crash if API sends a double (e.g. 4.5)
      averageRating: json['average_rating']?.toString() ?? "0.0",
      totalReviews: int.tryParse(json['total_reviews'].toString()) ?? 0,
      reviews: (json['reviews'] as List?)
              ?.map((item) => Review.fromJson(item))
              .toList() ??
          [],
    );
  }
}