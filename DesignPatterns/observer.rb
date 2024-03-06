# Design Patterns: Observer
# Behavioral
# Example 1:

class Subject
  # Lista de observadores
  attr_reader :observers

  def initialize
    @observers = []
  end

  # Agregar un observador a la lista
  def attach(observer)
    @observers << observer
  end

  # Eliminar un observador de la lista
  def detach(observer)
    @observers.delete(observer)
  end

  # Notifica a todos los observadores
  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Observer < Subject
  # Se llama cuando el sujeto cambia
  def update(subject)
    raise NotImplementedError, "#{self.class} no implementa el método 'update'"
  end
end

# Ejemplo de uso
class ConcreteSubject < Subject
  def some_business_logic
    # ... logica de negocio que cambia el estado del sujeto ...
    notify_observers
  end
end

class ConcreteObserver < Observer
  def update(subject)
    puts "El estado del sujeto ha cambiado"
  end
end

# Ejemplo de uso
subject = ConcreteSubject.new
observer = ConcreteObserver.new
subject.attach(observer)
subject.some_business_logic

# ##############################################
# Ejemplo 2:
module Observable

  def attach(observer)
  end

  def detach(observer)
  end

  def notify
  end
end

module ObserverYoutube
  def update
  end
end

class YoutubeChannel
  include Observable
  attr_reader :subscribers
  def initialize
    @subscribers = []
  end

  def attach(observer)
    @subscribers << observer
  end

  def detach(observer)
    @subscribers.delete(observer)
  end

  def add_video
    self.notify
  end

  def notify
    for observer in @subscribers
      observer.update
    end
  end
end

class Subscriber
  include ObserverYoutube
  @observable
  def initialize(observable)
    @observable = observable
  end

  def update
    puts "Nuevo video en el canal de Youtube"
  end
end

# Ejemplo de uso
channel = YoutubeChannel.new
s1 = Subscriber.new(channel)
s2 = Subscriber.new(channel)
s3 = Subscriber.new(channel)

channel.attach(s1)
channel.attach(s2)
channel.attach(s3)

channel.add_video
