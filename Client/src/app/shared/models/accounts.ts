export interface AccountRegister {
  firstname: string;
  lastname: string;
  email: string;
  password: string;
}

export interface CompanyRegister {
  idAccount: number;
  name: string;
  nip: string;
  headquarterAddress: string;
}

export interface AccountLogin {
  email: string,
  password: string,
  method: string,
  token: string
}

export interface AccountLoginSuccess {
  accessToken: string,
  allowsnotifications: boolean,
  email: string,
  emailconfirmed: boolean,
  firstName: string,
  id: number,
  lastName: string,
  name: string,
  refreshtoken: string,
  refreshtokenvalid: string,
  rolename: string,
  surname: string
}

export interface User {
  name: string;
  token: string;
}

export interface UserProfile {
  account: Account,
  accountCoursesCertificates: AccountCoursesCertificate [],
  accountTechnicalSkills: AccountTechnicalSkill[],
  accountSoftSkills: AccountSoftSkills [],
  accountTags: AccountTags [],
  accountSocialMediaLinksModelDto : AccountSocialMediaLinksModelDto [],
  accountEducationModelDto : accountEducationModelDto [],
  accountWorkExperiences : accountWorkExperiences[],
  accountWorkResponsibilities: AccountWorkResponsibilities[]
}

export interface accountWorkExperiences {
  id: number
  profession: string,
  workcompany: string,
  // idprofession?: number,
  // profession: number,
  idworkcompany: number,
  datestart: Date,
  dateend: Date,
  accountworkresponsibilities : AccountWorkResponsibilities[]
}

export interface AccountWorkResponsibilities {
  // id: number,
  name: string,
  // idaccount: number,
  // idaccountworkexperience: number,
  // createdat: Date
}

export interface accountEducationModelDto {
  id: number
  professionname: string,
  universityname: string,
  professionaltitle: string,
  datestart: Date,
  dateend : Date
}

export interface Account {
  allowsNotifications: boolean,
  birthdate: Date,
  createDate: Date,
  description: string,
  email: string,
  emailConfirmed: boolean,
  id: number,
  idRole: number,
  image: string,
  name: string,
  password?: string,
  phonenumber: string,
  refreshToken: string,
  refreshTokenValid: Date,
  salarymax: number,
  salarymin: number,
  surname: string,
  verificationCode: number,
  verificationCodeValid: Date,
  title: string,
  location: string,
  employmentmethod: number,
  position: string
}

export interface AccountCoursesCertificate {
  certificateissuedate: Date,
  certificatenumber: string,
  createdat: Date,
  expirationDate: Date,
  id: number,
  idaccount: number,
  idCertificate: number,
  idOrganizationIssuingCertificate: number,
  certificatename: string,
  organizationissuingcertificate: string
}

export interface AccountSoftSkills {
  createDate?: Date,
  id?: number,
  idaccount: number,
  idaccountsoftskillstitle: number;
  name: string
}

export interface AccountTags {
  info: string
}

export interface AccountSocialMediaLinksModelDto {
  name: string,
  link: string
}

export interface AccountTechnicalSkill {
  id: number;
  type: number;
  name: string;
  progress?: number | null;
  idaccount: number;
  idaccountNavigation: Account;
}