<div class="col-12" [hidden]="!schedulerService.expandSearch">
    <!-- <div class="row">
        <div class="col-12 col-md-8">
            <div class="form-group row">
                <label class="col-sm-7 col-form-label text-md-right">Work Type: </label>
                <div class="col-sm-5">
                    <select class="form-control" [(ngModel)]="orderCrewSearchModel.WorkType">
                        <option *ngFor="let data of dropDownData | ddlFilter : 'WorkType'" [value]="data.id">
                            {{data.name}}
                        </option>
                    </select>
                </div>
            </div>
        </div>
    </div> -->

    <div class="row mt-3">
        <div class="col text-center">
            <button type="submit" class="btn btn-primary btn-sm mr-2" (click)="searchOrdersAndCrews()">Search</button>
            <button type="reset" class="btn btn-primary btn-sm" (click)="resetSearchData()">Reset</button>
        </div>
    </div>
</div>

<div class="container">
    <div class="row" cdkDropListGroup>
        <div class="col-6" *ngIf="displayCrewOrderInfo">
            <div class="row scheduler header-row">
                <div class="col">
                    <h3>Crew Information</h3>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <table class="scheduler table table-bordered table-sm">
                        <thead>
                            <tr>
                                <th>Crew</th>
                                <th>Mon</th>
                                <th>Tues</th>
                                <th>Wed</th>
                                <th>Thur</th>
                                <th>Fri</th>
                                <th>Sat</th>
                                <th>Sun</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr *ngFor="let crew of lstCrew" cdkDropList>
                                <td style="background-color: #e9ecef;">
                                    Crew Id: {{crew.CrewId}}
                                    <br />
                                    <br />
                                    Crew Type: {{crew.CrewType}}
                                    <br />
                                    <br />
                                    Truck: {{crew.Truck}}
                                    <br />
                                    <br />
                                    Comments: {{crew.Comments}}
                                </td>
                                <td (mouseenter)="onMouseEnter(crew.CrewId, 'Monday')">
                                    <p>Available Capacity: <span
                                            style="font-weight: bold;">{{crew.Monday.AvailableCapacity}}</span></p>
                                    <!-- <p *ngFor="let order of crew.Monday.OrdersList" [ngClass]="order.orderStyle">
                                        {{order.orderKey}}-{{order.orderDesc}}<i style="padding-left: 4px;"
                                            class="fa fa-minus-square" title="Remove Mapping"
                                            (click)="removeMapping(order.orderKey, crew.CrewId, 'Monday')"></i></p> -->
                                </td>
                                <td (mouseenter)="onMouseEnter(crew.CrewId, 'Tuesday')">
                                    <p>Available Capacity: <span
                                            style="font-weight: bold;">{{crew.Tuesday.AvailableCapacity}}</span></p>
                                    <!-- <p *ngFor="let order of crew.Tuesday.OrdersList" [ngClass]="order.orderStyle">
                                        {{order.orderKey}}-{{order.orderDesc}}<i style="padding-left: 4px;"
                                            class="fa fa-minus-square" title="Remove Mapping"
                                            (click)="removeMapping(order.orderKey, crew.CrewId, 'Tuesday')"></i></p> -->
                                </td>
                                <td (mouseenter)="onMouseEnter(crew.CrewId, 'Wednesday')">
                                    <p>Available Capacity: <span
                                            style="font-weight: bold;">{{crew.Wednesday.AvailableCapacity}}</span></p>
                                    <!-- <p *ngFor="let order of crew.Wednesday.OrdersList" [ngClass]="order.orderStyle">
                                        {{order.orderKey}}-{{order.orderDesc}}<i style="padding-left: 4px;"
                                            class="fa fa-minus-square" title="Remove Mapping"
                                            (click)="removeMapping(order.orderKey, crew.CrewId, 'Wednesday')"></i></p> -->
                                </td>
                                <td (mouseenter)="onMouseEnter(crew.CrewId, 'Thursday')">
                                    <p>Available Capacity: <span
                                            style="font-weight: bold;">{{crew.Thursday.AvailableCapacity}}</span></p>
                                    <!-- <p *ngFor="let order of crew.Thursday.OrdersList" [ngClass]="order.orderStyle">
                                        {{order.orderKey}}-{{order.orderDesc}}<i style="padding-left: 4px;"
                                            class="fa fa-minus-square" title="Remove Mapping"
                                            (click)="removeMapping(order.orderKey, crew.CrewId, 'Thursday')"></i></p> -->
                                </td>
                                <td (mouseenter)="onMouseEnter(crew.CrewId, 'Friday')">
                                    <p>Available Capacity: <span
                                            style="font-weight: bold;">{{crew.Friday.AvailableCapacity}}</span></p>
                                    <!-- <p *ngFor="let order of crew.Friday.OrdersList" [ngClass]="order.orderStyle">
                                        {{order.orderKey}}-{{order.orderDesc}}<i style="padding-left: 4px;"
                                            class="fa fa-minus-square" title="Remove Mapping"
                                            (click)="removeMapping(order.orderKey, crew.CrewId, 'Friday')"></i></p> -->
                                </td>
                                <td (mouseenter)="onMouseEnter(crew.CrewId, 'Saturday')">
                                    <p>Available Capacity: <span
                                            style="font-weight: bold;">{{crew.Saturday.AvailableCapacity}}</span></p>
                                    <!-- <p *ngFor="let order of crew.Saturday.OrdersList" [ngClass]="order.orderStyle">
                                        {{order.orderKey}}-{{order.orderDesc}}<i style="padding-left: 4px;"
                                            class="fa fa-minus-square" title="Remove Mapping"
                                            (click)="removeMapping(order.orderKey, crew.CrewId, 'Saturday')"></i></p> -->
                                </td>
                                <td (mouseenter)="onMouseEnter(crew.CrewId, 'Sunday')">
                                    <p>Available Capacity: <span
                                            style="font-weight: bold;">{{crew.Sunday.AvailableCapacity}}</span></p>
                                    <!-- <p *ngFor="let order of crew.Sunday.OrdersList" [ngClass]="order.orderStyle">
                                        {{order.orderKey}}-{{order.orderDesc}}<i style="padding-left: 4px;"
                                            class="fa fa-minus-square" title="Remove Mapping"
                                            (click)="removeMapping(order.orderKey, crew.CrewId, 'Sunday')"></i></p> -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- </div>
    <div class="row"> -->
        <div class="col-6" *ngIf="orderInfo">
            <div class="row scheduler header-row">
                <div class="col">
                    <h3>Jobs available / Ready for work</h3>
                </div>
            </div>
            <div class="row" *ngIf="lstOrder.length > 0">
                <div class="col" style="overflow: scroll;height: 500px;
                    border-radius: 1px;
                    border:#dee2e6 1px solid;
                    padding: 10px">
                    <div class="orderContainer" cdkDropList #lstOrderList="cdkDropList" [cdkDropListData]="lstOrder"
                        (cdkDropListDropped)="drop($event)">

                        <div *ngFor="let card of lstOrder; let cardIndex = index ; ">

                            <div style="width: 30%;height: 100px;">

                                <mat-card>
                                    <mat-card-header>
                                        <div mat-card-avatar></div>
                                        <mat-card-title>{{card.orderKey }} </mat-card-title>
                                        <mat-card-subtitle>{{card.description}}</mat-card-subtitle>
                                    </mat-card-header>
                                    <div mat-card-image></div>
                                    <mat-card-content>
                                        <div style="display:inline-flex;">
                                            <div>
                                                <p>Work Center
                                                </p>
                                            </div>
                                            <div>
                                                {{card.plant}}
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <p>Order Type
                                                </p>
                                            </div>
                                            <div>
                                                {{card.orderType}}
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <p>Mat Type
                                                </p>
                                            </div>
                                            <div>
                                                {{card.mat}}
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <p>Basic Finish
                                                </p>
                                            </div>
                                            <div>
                                                {{card.basicFinishDate}}
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <p>Comments
                                                </p>
                                            </div>
                                            <div>
                                                {{card.comments}}
                                            </div>
                                        </div>
                                    </mat-card-content>
                                    <mat-card-actions>
                                        <button mat-button>LIKE</button>
                                        <button mat-button>SHARE</button>
                                    </mat-card-actions>
                                </mat-card>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col text-center">
            <button type="submit" class="btn btn-primary btn-lg mr-2" (click)="reviewSchedule()">Publish/Review</button>
            <button type="submit" class="btn btn-primary btn-lg" (click)="finalizeSchedule()">Finalize</button>
        </div>
    </div>
</div>
