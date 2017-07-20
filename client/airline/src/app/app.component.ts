import { Component } from '@angular/core';
import {Http, Response } from '@angular/http';

class Flight {
	id: number;
	origin: string;
	destination: string;
	dep_date: string;
	arr_date: string;
}

class Passenger {
	id: number;
	first_name: string;
	last_name: string;
	email: string;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
	newFlight: Flight = new Flight();
	currentFlight: Flight = new Flight();
	flights: Flight[] = [];
	baseApiUrl: string = 'http://localhost:9393/flights';

	constructor(private http: Http){
	//grab all flights from the API and set them to our flights array
	this.getFlights();
	// this.getPassengers();
	}

	getFlights(){
		this.http.get(this.baseApiUrl).subscribe(response =>
		  this.flights = response.json()
		)
	}

	postFlight(){
		this.http.post(this.baseApiUrl, this.newFlight).subscribe(response =>
		  this.flights.push(response.json())
		)
	}

	patchFlight(){
	// localhost:9393/flights/1
		this.http.patch(this.baseApiUrl + this.currentFlight.id, this.currentFlight).subscribe(response =>
		  this.flights = response.json()
		)
	}

	removeFlight(flight){
		this.http.delete(this.baseApiUrl + flight.id).subscribe(response =>
		  this.flights = response.json()
		)
	}

	editFlight(flight){
		this.currentFlight = Object.assign({}, flight);
	}

	onSubmitFlight(){
		console.log(this.newFlight);
	}


	// newPassenger: Passenger = new Passenger();
	// currentPassenger: Passenger = new Passenger();
	// passengers: Passenger[] = [];
	// baseApiUrl2: string = 'http://localhost:9393/passengers';

	// getPassengers(){
	// 	this.http.get(this.baseApiUrl).subscribe(response =>
	// 	  this.passengers = response.json()
	// 	)
	// }

	// postPassenger(){
	// 	this.http.post(this.baseApiUrl, this.newPassenger).subscribe(response =>
	// 	  this.passengers.push(response.json())
	// 	)
	// }

	// patchPassenger(){
	// // localhost:9393/passengers/1
	// 	this.http.patch(this.baseApiUrl + this.currentPassenger.id, this.currentPassenger).subscribe(response =>
	// 	  this.passengers = response.json()
	// 	)
	// }

	// removePassenger(passenger){
	// 	this.http.delete(this.baseApiUrl + passenger.id).subscribe(response =>
	// 	  this.passengers = response.json()
	// 	)
	// }

	// editPassenger(passenger){
	// 	this.currentPassenger = Object.assign({}, passenger);
	// }

	// onSubmitPassenger(){
	// 	console.log(this.newPassenger);
	// }
}
