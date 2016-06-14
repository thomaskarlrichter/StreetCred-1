import {Component} from "@angular/core";
import {NavController} from 'ionic-angular';
import {BarcodeScanner} from 'ionic-native';

@Component({
  templateUrl: 'build/pages/home/home.html'
})
export class HomePage {
  constructor(private _navController: NavController) {
    
  }

  startScan() {
     return BarcodeScanner.scan().then(
      (result) => {
        console.log(result);
      },
      (error) => {
        console.log(error);
      }
    )
  }
}
