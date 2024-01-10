# Design Pattern: Mediator
# Behavioral

# Sample Code:
class DialogDirector
  def initialize
  end

  def destroy
    # logica de destrucción si es necesario
  end

  def show_dialog
    raise NotImplementedError, "Debes implementar el método 'show_dialog' en la subclase"
  end

  def widget_changed(widget)
    raise NotImplementedError, "Debes implementar el método 'widget_changed' en la subclase"
  end

  def created_widgets
    raise NotImplementedError, "Debes implementar el método 'created_widgets' en la subclase"
  end
end
