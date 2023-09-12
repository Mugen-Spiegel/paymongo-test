# README

This README would normally document whatever steps are necessary to get the
application up and running.

Set-up the application by running this command

rails db:create && rails db:migrate && rails db:seed && rails s


View the available endpoint by importing this collection in your Postman
https://api.postman.com/collections/29693538-79b940b0-7339-4b4a-b288-6260df61dd54?access_key=PMAT-01HA5PQKGDEJZJ59HXAT32MRCD

http://127.0.0.1:3000/vehicles This endpoint create a vehicle parking transaction with required

params [plate_number, vehicle_type, gate]


http://127.0.0.1:3000/vehicles/:id This endpoint will close the transaction of specific vehicle or trigger the function

unpark. Required param id

http://127.0.0.1:3000/parking_transactions This endpoint will return all transactions with vehicle

http://127.0.0.1:3000/vehicles This endpoint will return all vehicle with it's transaction

http://127.0.0.1:3000/parking_slots This endpoint will return all parking slot

http://127.0.0.1:3000/parking_slots/vacant This endpoint will show all the vacant slot

http://127.0.0.1:3000/parking_slots/occupied This endpoint will show all the occupied slot and the list of associated transactions and vehicles