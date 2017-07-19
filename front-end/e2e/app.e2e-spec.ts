import { LilAppPage } from './app.po';

describe('lil-app App', () => {
  let page: LilAppPage;

  beforeEach(() => {
    page = new LilAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
