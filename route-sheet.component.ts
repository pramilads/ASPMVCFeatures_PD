import { Component } from '@angular/core';

import { SchedulerService } from './../../core/services/scheduler.service';

@Component({
  selector: 'route-sheet',
  templateUrl: './route-sheet.component.html'
})
export class RouteSheetComponent {
  lstCrew: any = [];

  constructor(public schedulerService: SchedulerService){
      
  }

  ngOnInit() {
    this.getCrewData();
  }

  getCrewData() {
    this.schedulerService.getScheduledCrews().subscribe(
      (res) => {
        console.log(res);
        this.lstCrew = res;
      });
  }

  getStyle(order){
    return (order.orderCategory == 'Compliance' || order.custComm == 'Y') ? 'orderRowCompCustComm' : 
                            order.orderCategory == 'COTD' ? 'orderRowCOTD' : null;
  }

  print(): void {
    let printContents, popupWin;
    printContents = document.getElementById('schedule').innerHTML;
    popupWin = window.open('', '_blank', 'top=0,left=0,height=auto,width=auto');
    popupWin.document.open();
    popupWin.document.write(`
        <html>
          <head>
            <title>Schedule</title>
            <style type="text/css">
              table th, table td {
              border:1px solid #000;
              }
              </style>
          </head>
          <body onload="window.print();window.close()">${printContents}</body>
        </html>`
    );
    popupWin.document.close();
  }
}
