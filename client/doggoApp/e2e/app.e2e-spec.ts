import { DoggoAppPage } from './app.po';

describe('doggo-app App', () => {
  let page: DoggoAppPage;

  beforeEach(() => {
    page = new DoggoAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
