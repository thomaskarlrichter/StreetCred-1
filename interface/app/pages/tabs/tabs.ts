import {Component} from '@angular/core'
import {HomePage} from '../home/home';
import {TopupPage} from '../topup/topup';
import {BadgesPage} from '../badges/badges';
import {SettingsPage} from '../settings/settings';

@Component({
    templateUrl: 'build/pages/tabs/tabs.html'
})
export class TabsPage {
    private tab1Root: any;
    private tab2Root: any;
    private tab3Root: any;
    private tab4Root: any;
    
    constructor() {
        this.tab1Root = HomePage;
        this.tab2Root = TopupPage;
        this.tab3Root = BadgesPage;
        this.tab4Root = SettingsPage;
    }
}