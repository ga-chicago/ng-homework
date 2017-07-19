import { Component } from '@angular/core';
import {Http, Response } from '@angular/http';


class Show{

	id: number;
	name: string;
	genre: string;
	stage: string;
	set_time: string;

}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

	newShow: Show = new Show();
	currentSet: Show = new Show();
	shows: Show[] = [];
	baseApiUrl: string = 'http://localhost:9393/sets/';

	constructor(private http: Http){
    //grab all heroes from the API and set them to our heroes array
    this.getSets();
  }

  getSets(){

  	this.http.get(this.baseApiUrl).subscribe(response =>
  			this.shows = response.json()
  		)
  }

  postSet(){

  	this.http.post(this.baseApiUrl, this.newShow).subscribe(response =>
  			this.shows.push(response.json())

  		)
  }

  patchSet(){

  		this.http.patch(this.baseApiUrl + this.currentSet.id, this.currentSet).subscribe(response =>

  				this.shows = response.json()
  			)
  }

  deleteSet(set){

  	this.http.delete(this.baseApiUrl + set.id).subscribe(response =>

  			this.shows = response.json()
  		)

  }
  editSet(set){

		this.currentSet = Object.assign({}, set);
	}




	onSubmit(){

		console.log(this.newShow);
	}

	

  
}
