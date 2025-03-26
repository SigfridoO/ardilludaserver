from django.shortcuts import render
from django.views.generic.base import TemplateView

from blessed import Terminal
term = Terminal()

# Create your views here.
class HomeView(TemplateView):
    template_name = "core/index.html"
    TAG:str = "HOME"

    def get(self, request, *args, **kwargs):
        print(term.bold_white('========================'))
        print(f'{term.bold_mediumseagreen(self.TAG)}')
        print(term.bold_white('========================'))

        return render(request, self.template_name, {})