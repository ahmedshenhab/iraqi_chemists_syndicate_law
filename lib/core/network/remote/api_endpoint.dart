class ApiEndpoint {
  ApiEndpoint._();
  static const String baseUrl = 'https://chemistssyndicate.runasp.net/';

  static const String pormotion = 'api/RequestPormotion';
  static const String register = 'auth/register';
  static const renew = 'api/UnionRenewalApplication';
  static const creat = 'api/UnionApplication';

  static const String token =
      'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjViNTZhYTEyLWZhZDMtNGVkMi04MTkxLTE3NzVlMzdmMWZlYyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2dpdmVubmFtZSI6ImFobWVkc2hlbmhhYjEyMzMyMSIsIkZ1bGxOYW1lIjoiYWhtZWQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhaG1lZHNoZW5oYWIxMjMzMjFAZ21haWwuY29tIiwiZXhwIjoxNzUyNzYxMDc3LCJpc3MiOiJodHRwczovL2NoZW1pc3Rzc3luZGljYXRlLnJ1bmFzcC5uZXQiLCJhdWQiOiJNeUJsZW5kZFVzZXJzIn0.UWlHTG9zSxbD3dHLI-FEv91q3DpFkAU3rAG8iMpb0Bk';

  static const userId =
      'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier';
}
