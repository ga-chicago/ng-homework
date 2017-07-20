import { Component } from '@angular/core';
import { Http, Response } from '@angular/http'

class Doggo{
	id: number;
	name: string;
	breed: string;
	age: string;
	owner: string
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
	newDoggo: Doggo = new Doggo();
	currentDoggo: Doggo = new Doggo();
	doggos: Doggo[] = [];
	baseApiUrl: string = 'http://localhost:9393/doggos/';

	constructor(private http: Http){
		this.getDoggos();
	}

	getDoggos(){
		this.http.get(this.baseApiUrl).subscribe(response =>
			this.doggos = response.json()
			)
	}

	postDoggo(){
		this.http.post(this.baseApiUrl, this.newDoggo).subscribe(response =>
			this.doggos.push(response.json())
		)
	}

	patchDoggo(){
		this.http.patch(this.baseApiUrl + this.currentDoggo.id, this.currentDoggo).subscribe(response =>
			this.doggos = response.json()
			) 
	}

	editDoggo(doggo){
		this.currentDoggo = Object.assign({},doggo)
	}

	deleteDoggo(doggo){
		this.http.delete(this.baseApiUrl + doggo.id).subscribe(response =>
			this.doggos = response.json()
			)
	}


}
