import '../../../../core/network/supabase_client.dart';
import '../../../../core/network/supabase_tables.dart';
import '../models/booking_model.dart';
import '../../../../core/enums/booking_status.dart';

class BookingRemoteDataSource {
  final _client = SupabaseService.client;

  Future<void> createBooking(BookingModel booking) async {
    if (booking.date.isBefore(DateTime.now())) {
      throw Exception('Invalid booking date');
    }

    await _client.from(SupabaseTables.bookings).insert(
          booking.toJson(),
        );
  }

  Future<List<BookingModel>> getUserBookings(String userId) async {
    final res = await _client
        .from(SupabaseTables.bookings)
        .select()
        .eq('user_id', userId)
        .order('date', ascending: false);

    return res.map<BookingModel>(BookingModel.fromJson).toList();
  }

  Future<void> updateBookingStatus(
    String bookingId,
    BookingStatus status,
  ) async {
    await _client
        .from(SupabaseTables.bookings)
        .update({'status': status.name})
        .eq('id', bookingId);
  }
}
