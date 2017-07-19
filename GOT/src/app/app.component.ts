import { Component } from '@angular/core';
import { Http, Response} from '@angular/http';

class Character{
	id: number;
	first_name: string;
	last_name: string;
	house: string;
	dead: boolean;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  
  newCharacter: Character = new Character();
  currentCharacter: Character = new Character();

  characters: Character[] = [];
  baseApiUrl: string = 'http://localhost:9393/characters/1';

  constructor(private http: Http){
  	this.getCharacters();
  }

  getCharacters(){
  	this.http.get(this.baseApiUrl).subscribe(response =>
  		this.characters = response.json()
  		)
  }


  onSubmit(){
  	console.log();
  }

}
