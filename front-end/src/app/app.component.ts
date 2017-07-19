import { Component } from '@angular/core';
import { Http, Response } from '@angular/http';

class Person {
	id: number;
	first_name: string;
  last_name: string;
	room_number: number;
	favorite_food: string;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  newPerson: Person = new Person();
  editPerson: Person = new Person();
  people: Person[] = [];
  baseApiUrl: string = 'http://localhost:9393/people/';

  constructor(private http: Http) {
    this.getPeople();
  }

  getPeople() {
    this.http.get(this.baseApiUrl).subscribe(response =>
      this.people = response.json()
    )
  }

  postPerson() {
    this.http.post(this.baseApiUrl, this.newPerson).subscribe(response =>
      this.people.push(response.json())
    )
  }

  selectPerson(person) {
    this.editPerson = Object.assign({}, person);
  }

  patchPerson() {
    this.http.patch(this.baseApiUrl + this.editPerson.id, this.editPerson).subscribe(response =>
      this.people = response.json()
    )
  }

  deletePerson(person) {
    this.http.delete(this.baseApiUrl + person.id).subscribe(response =>
      this.people = response.json()
    )
  }
  
}
