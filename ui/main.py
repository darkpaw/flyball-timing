import kivy
kivy.require('1.10.1')  # replace with your current kivy version !

from kivy.app import App
from kivy.uix.gridlayout import GridLayout
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput
from kivy.graphics import Color, Rectangle


class MainScreen(GridLayout):

    def __init__(self, **kwargs):
        super(MainScreen, self).__init__(**kwargs)
        self.cols = 3
        self.rows = 4

        self.padding = (7, 7)

        self.add_widget(Label(text='Left lights'))
        self.add_widget(Label(text='Status'))
        self.add_widget(Label(text='Right lights'))

        self.team_setup_left = TeamSetupPanel()
        self.add_widget(self.team_setup_left)

        self.race_setup = RaceSetupPanel()
        self.add_widget(self.race_setup)

        self.team_setup_right = TeamSetupPanel()
        self.add_widget(self.team_setup_right)

        self.add_widget(Label(text='Left gate'))
        self.add_widget(Label(text='Status'))
        self.add_widget(Label(text='Right gate'))

        self.add_widget(Label(text='Left time'))
        self.add_widget(Label(text='Status'))
        self.add_widget(Label(text='Right time'))


        # with self.canvas.before:
        #     Color(1, 0, .4, mode='rgb')
        #     Rectangle(pos=(10, 10), size=(500, 500))


class TeamSetupPanel(GridLayout):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.cols = 2
        self.rows = 6
        self.padding = (7, 7)

        self.row_force_default = True
        self.row_default_height = 32
        self.add_widget(Label(text='Breakout:'))
        self.txt_breakout = TextInput(multiline=False, text='0.00')
        self.add_widget(self.txt_breakout)
        self.add_widget(Label(text='Handicap:'))
        self.txt_handicap = TextInput(multiline=False, text='0.00')
        self.add_widget(self.txt_handicap)
        self.test_button = Button(text='Clear')
        self.add_widget(self.test_button)
        self.test_button = Button(text='??')
        self.add_widget(self.test_button)


class RaceSetupPanel(GridLayout):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.cols = 1
        self.rows = 2
        self.padding = (12, 12)
        self.row_force_default = True
        self.row_default_height = 32
        self.race_select_button = Button(text='Select race', padding=(6, 4))
        self.add_widget(self.race_select_button)
        self.clear_button = Button(text='Clear times')
        self.add_widget(self.clear_button)


class MyApp(App):

    def build(self):
        self.title = 'Flyball timing - prototype system 2019-03'
        return MainScreen()


if __name__ == '__main__':
    MyApp().run()
