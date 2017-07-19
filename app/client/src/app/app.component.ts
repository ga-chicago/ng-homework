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
	baseApiUrl: string = 'http://localhost:4200/';

	constructor(private http: Http){
		this.getRestaurants();
	}

	getRestaurants(){
		this.http.get(this.baseApiUrl).subscribe(response =>
			this.restaurants = response.json()
			)
	}


	postRestaurant(){
		this.http.get(this.baseApiUrl).subscribe(response =>
			this.restaurants.push(response.json())
			)
	}
}

// 	patchRestaurant(){

// 	}

// 	destroyRestaurant(restaurant){

// 	}

// 	editRestaurant(restaurant){

// 	}

// 	onSubmit(){
// 		console.log(this.newRestaurant);
// 	}
// }
