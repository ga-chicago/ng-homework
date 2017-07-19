import { NgHwApiPage } from './app.po';

describe('ng-hw-api App', () => {
  let page: NgHwApiPage;

  beforeEach(() => {
    page = new NgHwApiPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
