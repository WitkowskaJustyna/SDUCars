import { LightningElement, api, wire } from 'lwc';
import getRelatedVehicles from '@salesforce/apex/RelatedVehicleController.getRelatedVehicles';
const columns = [
    {label:'Brand', fieldName: 'Brand__c'},
    {label:'Model', fieldName: 'Model__c'}
]
export default class VehicleList extends LightningElement {
    columns = columns;
    @api showroomId;
    @wire(getRelatedVehicles,{showroomId:'$showroomId'}) relatedVehicles;
}