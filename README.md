# URl Shortener, test task

Implement a service to shorten URLs. The service should implement 3 requests:
- `POST /urls` - returns the sorten URL
- `GET /urls/:short_url` - returns the long URL and increases requests counter by 1
- `GET /urls/:short_url/stats` - returns shorten URL clicks count

It is necessary to keep statistics on unique IP requests.

The project should be implemented using Ruby on Rails. DB's choice is yours.
