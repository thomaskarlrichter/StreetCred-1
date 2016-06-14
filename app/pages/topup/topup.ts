import {Component} from "@angular/core";
import {NavController} from 'ionic-angular';

@Component({
  templateUrl: 'build/pages/topup/topup.html'
})
export class TopupPage {
    private balance: number = 101.23;
    
    constructor(private _navController: NavController) {
    
    }
}
