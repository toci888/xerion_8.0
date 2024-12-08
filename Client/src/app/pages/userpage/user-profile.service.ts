import { Injectable } from '@angular/core';
import {Observable} from "rxjs";
import {ReturnedResponse} from "../../shared/models/returned-response";
import {UserProfile} from "../../shared/models/accounts";
import {localUrl} from "../../shared/constants/constants";
import {HttpClient} from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class UserProfileService {

  private  = inject(); }

  private get controller() {
    return "api/Account"
  }

  getUserById(id: number): Observable<ReturnedResponse<UserProfile>> {
    return this.http.get<ReturnedResponse<UserProfile>>(`${localUrl}/${this.controller}/get-account-by-id?id=${id}`);
  }
}
