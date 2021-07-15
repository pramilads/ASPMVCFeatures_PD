<div class="col-12" [hidden]="!schedulerService.expandSearch">
    <div class="row mt-3">
        <div class="col text-center">
            <!-- <button type="submit" class="btn btn-primary btn-sm mr-2" (click)="searchOrdersAndCrews()">Search</button>
            <button type="reset" class="btn btn-primary btn-sm" (click)="resetSearchData()">Reset</button> -->
        </div>
    </div>
</div>

<div class="pagewrapper">
    <section class="todos-section-wrapper">

        <div class="left-card">
            <!-- <div cdkDropList #todoList="cdkDropList" [cdkDropListData]="todos"
                [cdkDropListConnectedTo]="[completedList]" class="list" (cdkDropListDropped)="drop($event)">
                <div class="todo-item" *ngFor="let todo of todos" cdkDrag>
                    <div class="cardContainer">
                        <mat-card class="card">
                            <mat-card-header class="card-header">
                                <mat-card-title class="card-title">{{todo.firstName}}</mat-card-title>
                            </mat-card-header>
                            <mat-card-content class="card-content">
                                <div>
                                    Last Name : - {{todo.lastName}}
                                </div>
                                <div>
                                    Designation - {{todo.designation}}
                                </div>
                            </mat-card-content>
                        </mat-card>
                    </div>
                </div>
            </div> -->


            <div *ngIf="showCrewCompostionTableData()">

                <table>
                    <thead>
                        <tr>
                            <!-- <th></th> -->
                            <th>Crew</th>
                            <th width="140px">Mon</th>
                            <th width="140px">Tue</th>
                            <th width="140px">Wed</th>
                            <th width="140px">Thur</th>
                            <th width="140px">Fri</th>
                            <th width="140px" *ngIf="checkWorkPeriod()" >Sat</th>
                            <th width="140px" *ngIf="checkWorkPeriod()">Sun</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr *ngFor="let items of membersDetails; let tdi= index">
                            <!-- <td style="vertical-align: top; width: 0%;">
                            </td> -->

                            <td style="min-width: 150px;vertical-align: top;">
                                <span class="rowItems " style="text-align: left; font-weight: bold;">
                                    {{ items['employee_Name'] }}
                                </span>
                                <span>
                                    <span class="rowItems " style="text-align: right;">


                                        <!-- {{ item.employee_Name }}: -->
                                        <!-- <span *ngIf="items[0].mondayShiftDetails">{{checkDay('M',items[0].mondayShiftDetails)}}</span>
                            <span *ngIf="items[0].tuesdayShiftDetails">{{checkDay('T',items[0].tuesdayShiftDetails)}}</span>
                            <span *ngIf="items[0].wednesdayShiftDetails">{{checkDay('W',items[0].wednesdayShiftDetails)}}</span>
                            <span *ngIf="items[0].thursdayShiftDetails">{{checkDay('R',items[0].thursdayShiftDetails)}}</span>
                            <span *ngIf="items[0].fridayShiftDetails">{{checkDay('F',items[0].fridayShiftDetails)}}</span>
                            <span *ngIf="items[0].saturdayShiftDetails">{{checkDay('S',items[0].saturdayShiftDetails)}}</span>
                            <span *ngIf="items[0].sundayShiftDetails">{{checkDay('U',items[0].sundayShiftDetails)}}</span> -->
                                    </span>
                                </span>
                                <span class="rowItems" style=" text-align: left; font-weight: bold; ">
                                    <!-- FOR TESTING ADDED CREW-ID -->
                                    <!-- CREW-ID: {{items['crewId']}} -->
                                    <br> Type: {{items['crew_Type']}}
                                </span>
                                <span class="rowItems"
                                    style=" text-align: left; font-weight: bold;word-wrap: inherit; ">
                                    TruckID: {{items['truck_Name']}}
                                </span>
                                <span class="rowItems" style=" text-align: left; font-weight: bold; ">
                                    WMC: {{items['wmc_Name']}}
                                </span>
                                <span class="rowItems"
                                    style=" text-align: left; font-weight: bold;word-wrap: inherit; ">
                                    Headquarter: {{items['headquarters_Name']}}
                                </span>
                                <br>
                            </td>

                            <td>
                                <div cdkDropList #todoList="cdkDropList" [cdkDropListData]="todos"
                                    [cdkDropListConnectedTo]="[completedList]" class="list"
                                    (cdkDropListDropped)="drop($event)">
                                    {{items['Monday']}}
                                </div>
                            </td>
                            <td>
                                {{items['Tuesday']}}
                            </td>
                            <td>
                                {{items['Wednesday']}}
                            </td>
                            <td>
                                {{items['Thursday']}}
                            </td>
                            <td>
                                {{items['Friday']}}
                            </td>
                            <td *ngIf="checkWorkPeriod()" >
                                {{items['Saturday']}}
                            </td>
                            <td *ngIf="checkWorkPeriod()">
                                {{items['Sunday']}}
                            </td>
                        </tr>
                    </tbody>
                </table><br><br><br>
            </div>
        </div>

        <div class="right-card" *ngIf="lstOrder!== null && lstOrder.length > 0">
            <div cdkDropList #completedList="cdkDropList" [cdkDropListData]="completed"
                [cdkDropListConnectedTo]="[todoList]" class="list" (cdkDropListDropped)="drop($event)">

                <mat-toolbar color="primary">
                </mat-toolbar>
                <div class="content">
                    <div fxLayout="row wrap" fxLayoutGap="16px grid">
                        <div [fxFlex]="(100/gridColumns) + '%'" fxFlex.xs="100%" fxFlex.sm="50%"
                            *ngFor="let card of lstOrder" cdkDrag>
                            <mat-card class="mat-elevation-z4 "  [ngStyle]="{'border-left': getColor(card.mat) }">`
                                <mat-card-header>
                                    <mat-card-title style="font-size: 11px;"><b> {{card.orderKey}}</b></mat-card-title>
                                    <!-- <mat-card-subtitle>{{card.orderKey}}<mat-card-subtitle> -->

                                </mat-card-header>
                                <mat-card-content>
                                    <div style="width: 100%; font-size: 9px;">
                                        <div>
                                            <p> WorkCenter : {{card.plant}}</p>
                                        </div>
                                        <div>
                                            <p>
                                                OrderType : {{card.orderType}} </p>
                                        </div>
                                        <div>
                                            <p>
                                                MatType : {{card.mat}}</p>
                                        </div>
                                        <div>
                                            <p>
                                                BasicFinish : {{card.basicFinishDate}}</p>
                                        </div>
                                        <div>
                                            <p>
                                                Comment : {{card.comments}}</p>
                                        </div>
                                    </div>
                                </mat-card-content>
                                <mat-card-actions>
                                    <!-- <button mat-button>LIKE</button>
                                    <button mat-button>SHARE</button> -->
                                </mat-card-actions>
                            </mat-card>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</div>
