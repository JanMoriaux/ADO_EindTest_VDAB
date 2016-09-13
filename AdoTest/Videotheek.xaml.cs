using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using AdoTestLIbrary;

namespace AdoTest
{
    /// <summary>
    /// Interaction logic for Videotheek.xaml
    /// </summary>
    /// 

    public partial class Videotheek : Window
    {
        public ObservableCollection<Film> Films;
        //public List<Film> NieuweFilms = new List<Film>();
        //public List<Film> OudeFilms = new List<Film>();

        public List<Genre> Genres;
        public CollectionViewSource FilmViewSource;


        public Videotheek()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            DbInladen();
        }

        private void DbInladen()
        {
            FilmViewSource =
                ((CollectionViewSource)(this.FindResource("filmViewSource")));
            var filmManager = new FilmManager();
            var genreManager = new GenreManager();

            Films = filmManager.GetFilms();
            FilmViewSource.Source = Films;
            //Films.CollectionChanged += this.OnCollectionChanged;

            Genres = genreManager.GetGenres();
            genreComboBox.ItemsSource = Genres;
            genreComboBox.DisplayMemberPath = "GenreNaam";
            genreComboBox.SelectedValuePath = "GenreNr";
            genreComboBox.IsEnabled = false;
            Update();
        }

        //private void OnCollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        //{
        //    if (e.NewItems != null)
        //    {
        //        foreach (Film nieuweFilm in e.NewItems)
        //        {
        //            NieuweFilms.Add(nieuweFilm);
        //        }
        //    }
        //    if (e.OldItems != null)
        //    {
        //        foreach (Film oudeFilm in e.OldItems)
        //        {
        //            OudeFilms.Add(oudeFilm);
        //        }
        //    }
        //}

        private void Update()
        {
            Film selectedMovie = (Film)FilmViewSource.View.CurrentItem;
            if (selectedMovie != null)
            {
                genreComboBox.SelectedValue = selectedMovie.Genre;
            }
            buttonVerwijderen.IsEnabled = true;
            buttonToevoegen.Content = "Toevoegen";
            buttonOpslaan.Content = "Wijzigingen Opslaan";
            listBoxFilms.IsEnabled = true;

        }

        private void listBoxFilms_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void buttonToevoegen_Click(object sender, RoutedEventArgs e)
        {
            if (buttonVerwijderen.IsEnabled)
            {
                listBoxFilms.SelectedIndex = -1;
                buttonVerwijderen.IsEnabled = false;
                listBoxFilms.IsEnabled = false;
                genreComboBox.IsEnabled = true;
                genreComboBox.SelectedIndex = 0;
                buttonToevoegen.Content = "Toevoegen annuleren";
                buttonOpslaan.Content = "Nieuwe Film Opslaan";
            }
            else if (!buttonVerwijderen.IsEnabled)
            {
                DbInladen();
            }
        }

        private void buttonOpslaan_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (buttonVerwijderen.IsEnabled)
                {
                    List<Film> gewijzigdeFilms = new List<Film>();
                    foreach (var eenFilm in Films)
                    {
                        if (eenFilm.Changed)
                        {
                            gewijzigdeFilms.Add(eenFilm);
                        }
                    }
                    if (gewijzigdeFilms.Count > 0)
                    {
                        try
                        {
                            var manager = new FilmManager();
                            manager.UpdateFilms(gewijzigdeFilms);
                            MessageBox.Show("Wijzigingen Opgeslagen");
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message);
                        }
                    }
                    else
                        MessageBox.Show("Er zijn geen wijzigingen!");
                }
                else if (!buttonVerwijderen.IsEnabled)
                {
                    Film toegevoegdeFilm = new Film()
                    {
                        Titel = titelTextBox.Text,
                        Genre = (Int32)genreComboBox.SelectedValue,
                        InVoorraad = Int32.Parse(inVoorraadTextBox.Text),
                        Uitgeleend = Int32.Parse(uitgeleendTextBox.Text),
                        Prijs = Decimal.Parse(prijsTextBox.Text),
                        TotaalVerhuurd = Int32.Parse(totaalVerhuurdTextBox.Text)
                    };
                    var manager = new FilmManager();
                    if (manager.InsertFilm(toegevoegdeFilm) == 0)
                    {
                        MessageBox.Show("Probleem bij opslaan");
                    }
                    else
                        MessageBox.Show("Film toegevoegd");
                    DbInladen();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void buttonVerwijderen_Click(object sender, RoutedEventArgs e)
        {
            if (listBoxFilms.SelectedIndex > 0 && MessageBox.Show("Weet u zeker dat u deze film wilt verwijderen?", "Verwijderen",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    var manager = new FilmManager();
                    if (manager.DeleteFilm((Film)listBoxFilms.SelectedItem) != 0)
                    {
                        MessageBox.Show("Film Verwijderd");
                        DbInladen();
                    }
                    else
                    {
                        MessageBox.Show("Probleem met verwijderen van de film!");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
    }
}
