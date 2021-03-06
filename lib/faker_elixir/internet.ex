defmodule FakerElixir.Internet do
  @moduledoc """
  Generate fake data for the domain Internet
  """

  import FakerElixir.Helpers.App

  @doc """
  Return an email

  ## Examples

  ```
  iex> FakerElixir.Internet.email
  "demarcus@ezra.io"
  ```

  You can set :popular to generate an email with a popular domain
  ```
  FakerElixir.Internet.email(:popular)
  "candelario@gmail.com"
  ```
  """
  def email do
    first_name = (:first_names |> fetch |> pick |> slug)
    email(first_name)
  end

  def email(:popular) do
    first_name = (:first_names |> fetch |> pick |> slug)
    email(:popular, first_name)
  end

  @doc """
  Return an email with the name given

  ## Examples

  ```
  iex> FakerElixir.Internet.email("Peter Moleski")
  "peter.moleski@ethel.net"
  ```
  """
  def email(name) do
    name = (name |> slug)
    domain = (:first_names |> fetch |> pick |> slug)
    extension = (:domain_extensions |> fetch |> pick)

    "#{name}@#{domain}.#{extension}"
  end

  @doc """
  Return an email with a popular domain for the name given

  ## Examples

  ```
  iex> FakerElixir.Internet.email(:popular, "Peter Sobieska")
  "peter.sobieska@hotmail.com"
  ```
  """
  def email(:popular, name) do
    name = (name |> slug)
    domain_popular = (:domain_popular_emails |> fetch |> pick)

    "#{name}@#{domain_popular}"
  end

  @doc """
  Return an user name

  ## Examples

  ```
  iex> FakerElixir.Internet.user_name
  "chadrick"
  ```
  """
  def user_name do
    choice = (0..1 |> pick)
    do_user_name(choice)
  end

  defp do_user_name(0) do
    first_name = (:first_names |> fetch |> pick)
    user_name(first_name)
  end

  defp do_user_name(1) do
    first_name = (:first_names |> fetch |> pick)
    last_name = (:last_names |> fetch |> pick)
    name = "#{first_name} #{last_name}"

    user_name(name)
  end

  @doc """
  Return an user name for the name given

  ## Examples

  ```
  iex> FakerElixir.Internet.user_name("Jeremie GES")
  "jeremie.ges"
  ```
  """
  def user_name(name) do
    name |> slug
  end

  @doc """
  Return an url

  ## Examples

  ```
  iex> FakerElixir.Internet.url
  "http://www.alejandra-connelly.com/"
  ```
  """
  def url do
    domain = do_url()

    "http://#{domain}/"
  end

  @doc """
  Return an url with https://

  ## Examples

  ```
  iex> FakerElixir.Internet.url(:safe)
  "https://www.stefan-little.org/"
  ```
  """
  def url(:safe) do
    domain = do_url()

    "https://#{domain}/"
  end

  defp do_url do
    choice = (0..1) |> pick

    do_url(choice)
  end

  defp do_url(0) do
    domain = (:first_names |> fetch |> pick |> slug)
    extension = (:domain_extensions |> fetch |> pick)

    "www.#{domain}.#{extension}"
  end

  defp do_url(1) do
    first_name = (:first_names |> fetch |> pick |> slug)
    last_name = (:last_names |> fetch |> pick |> slug)
    extension = (:domain_extensions |> fetch |> pick)

    "www.#{first_name}-#{last_name}.#{extension}"
  end

end
