add class Dungeon extends RoomJob
  label: "Dungeon"
  effects:
    depravity: -25
    men: -2
  size: 'small'
  text: ->"""Slaves need a place to stay too, until I find a task for them. I can't have more than six unused slaves per dungeon. Takes two male slave-guards to keep them fed and clean and pacified."""

add class Dungeon extends Page
  text: -> """|| bg="Dungeon/Empty"
    -- Normally I'd have a team of architects to handle this sort of mundane work, but with things as they are, well...
    --> One thing this pathetic kingdom of "America" does do well is buildings. It's hardly even cold at all, much more pleasant for the inmates. I'm more of a torture-you-with-pleasure sort of Dark Lady than a torture-you-with-misery one, so that's nice.
    --> All I need is some additional soundproofing and a couple of places to set the chains in the floor, and my new dungeon is complete.
  """

add class Dungeon extends Job
  label: "Dungeon"
  text: ->"""It's a dungeon. It holds six slaves until I find a use for them. No fun to be had here, just a soundproofed holding pen."""
  type: 'boring'
  people: {}

Job.Dungeon::next = add class DungeonDaily extends Page
  text: ->
    if Math.random() < 0.75 or g.events.DungeonDaily?[0] is g.day then return false
    """|| class="jobStart" auto="1800"
        <h4>Dungeon</h4>

    """ + Math.choice [
      """|| bg="Dungeon/Empty"
        -- It's not my favorite place to keep people, but sometimes they just need to wait their turn for a while."""
      """|| bg="Dungeon/1"
        -- She looks so excited, doesn't she? But she'll just have to wait a few days while I decide whether she's going to be the one fucking or the getting fucked.""",
      """|| bg="Dungeon/2"
        -- The screaming got to be a bit much. I decorated her with a bit of extra chain while I was at it.""",
      """|| bg="Dungeon/3"
        -- I love that rebellious expression. She'll make the cutest little dominatrix, won't she?""",
    ]
