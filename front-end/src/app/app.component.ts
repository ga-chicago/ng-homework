import { Component } from '@angular/core';

class Person {
	id: number;
	name: string;
	room_number: number;
	floor_id: number;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  person: Person = new Person();
  books: Book[] = []

  submitBook() {
  	this.books.push(this.book);
  }
}
