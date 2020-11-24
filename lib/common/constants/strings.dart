import 'package:google_maps_flutter/google_maps_flutter.dart';

//NAME OF APP
String nameOfApp = "Majobs";

//TO DETERMINE IF PAGE IS SEEN STORE TO LOCAL STORAGE THIS SETTING
const String ONBOARDING_PAGE_SEEN = 'isSeen';
const String NOTIFICATION_MSG_SEEN = 'notificationIsSeen';
const String SP_SEES_HOME_PAGE = 'firstTimeSPSeesHomePage';

//LIST OF CATEGORIES
const String LIST_OF_CATEGORIES = 'listofcategories';

//ERROR MESSAGES FROM API CALLS
const String SERVER_ERROR_MESSAGE = 'Server error occurred try again';
const String NO_INTERNET_MESSAGE = 'No internet connection available';
const String USER_NOT_FOUND =
    'User does not exist check either your username or password';

//SOCIAL SHARING MESSAGE
//TODO
//add app link
const String SOCIAL_SHARE_MESSAGE =
    "Majobs is brilliant! You can find a range of service providers(electricians,beauticians,health care workers and more). Its easy to use. Download the app using this link";

//GOOGLE MAP API KEY
const GOOGLE_MAP_API_KEY = 'AIzaSyCDCticZCnKu9bDpMXNaCG96zPEiD8sipg';

//USER INFORMATION TO BE STORED LOCALLY AFTER REGISTRATION OR LOGIN
const String ACCESS_TOKEN = 'access_token';
const USER_ID = 'id';
const USER_PHOTO_URL = 'photourl';
const USER_TYPE_ID = 'usertypeid';
const USER_NAME = 'username';
const USER_LOCATION = 'location';
const USER_SKILLS = 'skills';
const USER_BIO = 'bio';
const USER_PHONE = 'phone';
const USER_CITY = 'city';

//DETERMINE STATUS OF SP/CLIENT JOURNEY WITHIN THE INBOX
const String INBOX_ACTION_BUTTON_CLICKED = 'isClicked';
const String SERVER = 'server';
const String SERVER_MSG_TYPE_NORMAL = 'normal';
const String SERVER_MSG_TYPE_IMAGE = 'image';
const String SERVER_MSG_TYPE_ENQUIRY = 'enquiry';
const String SERVER_MSG_TYPE_BOOKING_CONFIRMED = 'booking_confirmed';
const String SERVER_MSG_TYPE_JOB_APPROVAL = 'job_approval';
const String SERVER_MSG_TYPE_BOOKING_DECLINED = 'booking_declined';
const String SERVER_MSG_TYPE_REQUEST_MORE_TIME = 'request_time';
const String SERVER_MSG_TYPE_WORK_COMPLETED = 'work_completed';
const String SERVER_MSG_TYPE_PAYMENT_CONFIRMED = 'payment_confirmed';
const String SERVER_MSG_STATUS_ENQUIRY = 'enquiry_sent';
const String SERVER_MSG_STATUS_BOOKING_CONFIRMED = 'booking_confirmed';
const String SERVER_MSG_STATUS_BOOKING_DECLINED = 'booking_declined';
const String SERVER_MSG_STATUS_PRICE_SET = 'price_set';
const String SERVER_MSG_STATUS_JOB_APPROVED = 'job_approved';
const String SERVER_MSG_STATUS_JOB_DISAPPROVED = 'job_disapproved';
const String SERVER_MSG_STATUS_PRICE_CONFIRMED = 'price_confirmed';
const String SERVER_MSG_STATUS_REQUEST_TIME_UNCONFIRMED = 'price_unconfirmed';
const String SERVER_MSG_STATUS_REQUEST_TIME_CONFIRMED = 'price_confirmed';
const String SERVER_MSG_STATUS_WORK_UNCOMPLETED = 'work_uncompleted';
const String SERVER_MSG_STATUS_WORK_COMPLETED = 'work_completed';
const String SERVER_MSG_STATUS_UNPAID = 'unpaid';
const String SERVER_MSG_STATUS_PAID = 'paid';

//LIST OF LOCATIONS SP CAN CHOOSE OR CLIENT CAN SEARCH BY
const List<String> locations = [
  'Airbase',
  'Baba Dogo',
  'BuruBuru',
  'California',
  'Chokaa',
  'Clay City',
  'Dandora Area 1',
  'Dandora Area 2',
  'Dandora Area 3',
  'Dandora Area 4',
  'Donholm',
  'Eastleigh North',
  'Eastleigh South',
  'Gatina',
  'Gikomba(Kamukunji)',
  'Githurai',
  'Hospital(Martha Re)',
  'Huruma',
  'Imara Daima',
  'Kabiro',
  'Kahawa West',
  'Kamulu/Joska(Kasarani)',
  'Kangemi',
  'Kariobangi North',
  'Kariobangi South',
  'Kawangware',
  'Kayole North',
  'Kayole South',
  'Kiamaiko',
  'Kileleshwa',
  'Kitisuru',
  'Komarock',
  'Korogocho',
  'Kwa Njenga',
  'Kwa Reuben',
  'Kware',
  'Laini Saba',
  'Landimawe',
  'Langata',
  'Lavington',
  'Lindi',
  'Lucky Summer',
  'Mabatini',
  'Makina',
  'Makongeni',
  'Maringo/Hamza',
  'Mathare North',
  'Matopeni/Spring Valley',
  'Maziwa',
  'Mihango',
  'Mlango Kubwa',
  'Mountain View',
  'Mowlem',
  'Muthaiga',
  'Mutuini',
  'Mwiki',
  'Nairobi South',
  'Nairobi West',
  'Ngando',
  'Ngei',
  'Njiru',
  'Nyayo Highrise',
  'Pangani',
  'Parklands/Highridge',
  'Pipeline',
  'Pumwani',
  'Ridgeways',
  'Riruta',
  'Roysambu',
  'Ruai',
  'Runda',
  'Sarang\'Ombe',
  'South B',
  'South C',
  'Spring Valley',
  'Umoja 1',
  'Umoja 2',
  'Utalii',
  'Utawala',
  'Uthiru/Ruthimitu',
  'Viwandani(Makadara)',
  'Waithaka',
  'Westlands',
  'Woodley/Kenyatta Golf Course',
  'Zimmermann',
  'Ziwani/Karokor',
];

//LOCATION CORDINATES
const Map<String, LatLng> coordinates = {
  'Airbase': LatLng(-1.315271, 36.919494),
  'Baba Dogo': LatLng(-1.2433697, 36.8748469),
  'BuruBuru': LatLng(-1.272089, 36.8723073),
  'California': LatLng(-1.2842693, 36.8449008),
  'Chokaa': LatLng(-1.2479493, 36.9491672),
  'Clay City': LatLng(-1.247901, 36.9338463),
  'Dandora Area 1': LatLng(-1.2520586, 36.8846724),
  'Dandora Area 2': LatLng(-1.2523434, 36.8958498),
  'Dandora Area 3': LatLng(-1.2485398, 36.9029857),
  'Dandora Area 4': LatLng(-1.2427407, 36.9022001),
  'Donholm': LatLng(-1.294743, 36.8877533),
  'Eastleigh North': LatLng(-1.2730481, 36.8433741),
  'Eastleigh South': LatLng(-1.2835403, 36.8513741),
  'Gatina': LatLng(-1.2797365, 36.7508571),
  'Gikomba(Kamukunji)': LatLng(-1.2855419, 36.8382064),
  'Githurai': LatLng(-1.2072974, 36.9057941),
  'Hospital(Martha Re)': LatLng(-1.2594644, 36.850066),
  'Huruma': LatLng(-1.2559338, 36.8668362),
  'Imara Daima': LatLng(-1.3465857, 36.8680131),
  'Kabiro': LatLng(-1.2878559, 36.7494117),
  'Kahawa West': LatLng(-1.188647, 36.8984695),
  'Kamulu/Joska(Kasarani)': LatLng(-1.2527309, 37.0636446),
  'Kangemi': LatLng(-1.2708772, 36.7334716),
  'Kariobangi North': LatLng(-1.2556829, 36.8781702),
  'Kariobangi South': LatLng(-1.266235, 36.8811423),
  'Kawangware': LatLng(-1.2814154, 36.7394723),
  'Kayole North': LatLng(-1.2636771, 36.9234021),
  'Kayole South': LatLng(-1.2674976, 36.9136723),
  'Kiamaiko': LatLng(-1.2561516, 36.8714546),
  'Kileleshwa': LatLng(-1.2786574, 36.7769856),
  'Kitisuru': LatLng(-1.2179525, 36.7779674),
  'Komarock': LatLng(-1.2677414, 36.905297),
  'Korogocho': LatLng(-1.2524607, 36.8806749),
  'Kwa Njenga': LatLng(-1.3175116, 36.8789099),
  'Kwa Reuben': LatLng(-1.3174257, 36.8789099),
  'Kware': LatLng(-1.3173828, 36.8789099),
  'Laini Saba': LatLng(-1.312061, 36.7920237),
  'Landimawe': LatLng(-1.292963, 36.8255976),
  'Langata': LatLng(-1.364143, 36.7012496),
  'Lavington': LatLng(-1.2796246, 36.7624524),
  'Lindi': LatLng(-1.3157209, 36.792232),
  'Lucky Summer': LatLng(-1.2392527, 36.8967807),
  'Mabatini': LatLng(-1.2040582, 36.9101361),
  'Makina': LatLng(-1.3092697, 36.7804301),
  'Makongeni': LatLng(-1.2974989, 36.8483162),
  'Maringo/Hamza': LatLng(-1.292983, 36.8705486),
  'Mathare North': LatLng(-1.2519754, 36.8704969),
  'Matopeni/Spring Valley': LatLng(-1.2619008, 36.9266482),
  'Maziwa': LatLng(-1.2847351, 36.7569894),
  'Mihango': LatLng(-1.2928474, 36.9238751),
  'Mlango Kubwa': LatLng(-1.2650147, 36.8425494),
  'Mountain View': LatLng(-1.2712406, 36.7278329),
  'Mowlem': LatLng(-1.2674342, 36.8880767),
  'Muthaiga': LatLng(-1.2457912, 36.8026955),
  'Mutuini': LatLng(-1.2904918, 36.6958972),
  'Mwiki': LatLng(-1.2248226, 36.9141126),
  'Nairobi South': LatLng(-1.3049048, 36.8329613),
  'Nairobi West': LatLng(-1.3157376, 36.8039019),
  'Ngando': LatLng(-1.3009214, 36.7331468),
  'Ngei': LatLng(-1.2928658, 36.8077758),
  'Njiru': LatLng(-1.2532583, 36.9101929),
  'Nyayo Highrise': LatLng(-1.3157988, 36.8036021),
  'Pangani': LatLng(-1.2666681, 36.8366178),
  'Parklands/Highridge': LatLng(-1.2596838, 36.816363),
  'Pipeline': LatLng(-1.3106768, 36.884874),
  'Pumwani': LatLng(-1.2825319, 36.8437042),
  'Ridgeways': LatLng(-1.2252576, 36.8376793),
  'Riruta': LatLng(-1.2925456, 36.7325955),
  'Roysambu': LatLng(-1.2177158, 36.8829831),
  'Ruai': LatLng(-1.2550427, 36.9625038),
  'Runda': LatLng(-1.2138152, 36.8095071),
  'Sarang\'Ombe': LatLng(-1.3132816, 36.7777315),
  'South B': LatLng(-1.3106166, 36.8282245),
  'South C': LatLng(-1.3224047, 36.8191073),
  'Spring Valley': LatLng(-1.2580463, 36.7849865),
  'Umoja 1': LatLng(-1.2817893, 36.8844359),
  'Umoja 2': LatLng(-1.2796655, 36.8936842),
  'Utalii': LatLng(-1.2531164, 36.8577913),
  'Utawala': LatLng(-1.2931139, 36.942534),
  'Uthiru/Ruthimitu': LatLng(-1.2741365, 36.6955661),
  'Viwandani(Makadara)': LatLng(-1.3066804, 36.8721557),
  'Waithaka': LatLng(-1.2843555, 36.7104303),
  'Westlands': LatLng(-1.268114, 36.8056513),
  'Woodley/Kenyatta Golf Course': LatLng(-1.3034677, 36.776564),
  'Zimmermann': LatLng(-1.2107167, 36.8973757),
  'Ziwani/Karokor': LatLng(-1.2787803, 36.8347034),
};

//LIST OF RATINGS
const List<String> ratings = [
  'Rating',
  '1',
  '2',
  '3',
  '4',
  '5',
];

//LIST OF SKILLS

const List<String> skills = [
  'Plumbing',
  'Electrician',
  //'Cleaning Services',
  'Laundry',
  //'Home Cleaning',
  //'Furniture Making and Repair',
  'Gardening',
  'Fumigation',
  'Repairs',
  //'Moving'
];
