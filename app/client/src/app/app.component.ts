import { Component } from '@angular/core';
import { Http, Response } from '@angular/http';


class Restaurant {
	id: number;
	name: string;
	address: string;
	cuisine_type: string;
	company: string;
}


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
	newRestaurant: Restaurant = new Restaurant ();
	currentRestaurant: Restaurant = new Restaurant();
	restaurants: Restaurant [] = [];
	baseApiUrl: string = 'http://localhost:9393/restaurants';

	constructor(private http: Http){
		this.getRestaurants();
	}

	getRestaurants(){
		this.http.get(this.baseApiUrl).subscribe(response =>
			this.restaurants = response.json()
			)
	}


	postRestaurant(){
		this.http.post(this.baseApiUrl, this.newRestaurant).subscribe(response =>
			this.restaurants.push(response.json())
			)
	}


	patchRestaurant(){
		this.http.patch(this.baseApiUrl + this.currentRestaurant.id, this.currentRestaurant).subscribe(response =>
      		this.restaurants = response.json()
			)
	}

	destroyRestaurant(restaurant){
		this.http.delete(this.baseApiUrl + restaurant.id).subscribe(response =>
      		this.restaurants = response.json()
			)
	}

	editRestaurant(restaurant){
		this.currentRestaurant = Object.assign({}, restaurant);
	}

	onSubmit(){
		console.log(this.newRestaurant);
	}
}
